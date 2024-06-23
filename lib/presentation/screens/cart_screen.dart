import 'package:ecommerce/data/model/cart_model.dart';
import 'package:ecommerce/presentation/bloc/cart/cart_bloc.dart';
import 'package:ecommerce/core/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {},
            child: SvgPicture.asset('assets/icons/bell.svg'),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: AppColor.redVelvet),
                ),
              );
            }

            if (state is CartLoaded) {
              return state.carts.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.carts.length,
                      itemBuilder: (context, index) {
                        final Cart cart = state.carts[index];

                        return _renderCartItem(cart, context);
                      },
                    )
                  : const Center(
                      child: Text('Opps!, add product to cart first.'),
                    );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoaded && state.carts.isNotEmpty) {
            final totalPrice = state.carts
                .map((cart) => cart.totalPrice)
                .reduce((value, element) => value + element);

            return Container(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 30, top: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        totalPrice.toString(),
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            backgroundColor: AppColor.primary,
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Checkout',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Dismissible _renderCartItem(Cart cart, BuildContext context) {
    return Dismissible(
      key: Key(cart.product.id.toString()),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        BlocProvider.of<CartBloc>(context).add(RemoveFromCart(
          productId: cart.product.id,
        ));
      },
      background: Container(
          decoration: BoxDecoration(
            color: AppColor.redVelvet,
          ),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Icon(
            Icons.restore_from_trash_outlined,
            color: Colors.white,
            size: 30,
          )),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        shape: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.softGrey),
        ),
        leading: Image.network(
          cart.product.image,
          width: 60,
          height: 80,
          fit: BoxFit.contain,
        ),
        title: Text(
          cart.product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          cart.product.price.toString(),
          style: TextStyle(
            color: AppColor.redVelvet,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.softGrey,
                padding: const EdgeInsets.all(0),
              ),
              onPressed: () {
                if (cart.cartQty <= 1) return;

                BlocProvider.of<CartBloc>(context).add(UpdateCart(
                  productId: cart.product.id,
                  isAdd: false,
                ));
              },
              icon: const Text('-', style: TextStyle(fontSize: 26)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                cart.cartQty.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: AppColor.primary,
              ),
              onPressed: () {
                BlocProvider.of<CartBloc>(context).add(UpdateCart(
                  productId: cart.product.id,
                  isAdd: true,
                ));
              },
              icon: const Icon(
                Icons.add,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
