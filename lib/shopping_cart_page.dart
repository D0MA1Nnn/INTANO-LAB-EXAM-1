import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => debugPrint('Back clicked'),
        ),

        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => debugPrint('Cart clicked'),
              icon: _bagIcon(),
              tooltip: 'Shopping bag',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.circular(20),
                ),

                child: const Text(
                  'CAMPUS STORE',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Ready for checkout',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Review your items before placing your order.',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              const SizedBox(height: 28),
              _deliveryCard(context),
              const SizedBox(height: 28),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order Items',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text('3 items', style: TextStyle(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                name: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse,
              ),
              const CartItemCard(
                name: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.usb,
              ),
              const CartItemCard(
                name: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop,
              ),
              const SizedBox(height: 20),
              _discountBanner(),
              const SizedBox(height: 20),
              _paymentSummary(),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      debugPrint('Place order clicked! Total: PHP 1850.00'),
                  icon: const Icon(Icons.lock_outline),
                  label: const Text('Place Order'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bagIcon() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Icon(Icons.shopping_bag_outlined, size: 28),
        Positioned(
          right: -8,
          top: -8,
          child: Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _deliveryCard(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Colors.blue, size: 28),
            const SizedBox(width: 12),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Deliver to Student\'s Justine Ric Intano',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 6),
                  Text(
                    'Matina, Davao City',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                debugPrint('Change delivery address clicked');
              },
              child: const Text('Change'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _discountBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.local_offer_outlined, color: Colors.blue),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text('10% discount on items'),
              ],
            ),
          ),
          const Icon(Icons.check_circle, color: Colors.blue),
        ],
      ),
    );
  }

  Widget _paymentSummary() {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Summary',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 18),
            _summaryRow('Subtotal', 'PHP 2,000.00'),
            const SizedBox(height: 12),
            _summaryRow('Discount (10%)', '− PHP 200.00'),
            const SizedBox(height: 12),
            _summaryRow('Delivery Fee', 'PHP 50.00'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1),
            ),
            _summaryRow('Total', 'PHP 1,850.00', emphasize: true),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String amount, {bool emphasize = false}) {
    final style = TextStyle(
      fontWeight: emphasize ? FontWeight.bold : FontWeight.normal,
      fontSize: emphasize ? 17 : 14,
      color: emphasize ? Colors.black : Colors.grey[700],
    );

    return Row(
      children: [
        Expanded(child: Text(label, style: style)),
        Text(amount, style: style),
      ],
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String name;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: Colors.blue),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        price,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => debugPrint('Remove item: $name'),
                  icon: const Icon(Icons.delete_outline),
                  tooltip: 'Remove item',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () => debugPrint('Decrease quantity: $name'),
                  icon: const Icon(Icons.remove),
                  tooltip: 'Decrease quantity',
                ),
                Text('$quantity'),
                IconButton(
                  onPressed: () => debugPrint('Increase quantity: $name'),
                  icon: const Icon(Icons.add),
                  tooltip: 'Increase quantity',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
