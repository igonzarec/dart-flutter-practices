import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
// import 'package:formvalidation/src/providers/productos_provider.dart';

class HomePage extends StatelessWidget {
  // final productosProvider = new ProductosProvider();

  @override
  Widget build(BuildContext context) {
    // final bloc = Provider.of(context);

    final productosBloc = Provider.productosBloc(context);
    productosBloc.cargarProductos();

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: _crearListado(productosBloc),
      floatingActionButton: _crearBoton(context),
    );
  }

  _crearBoton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => Navigator.pushNamed(context, 'producto'),
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _crearListado(ProductosBloc productosBloc) {
    return StreamBuilder(
      stream: productosBloc.productosStream,
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) {
        if (snapshot.hasData) {
          final productos = snapshot.data;

          return ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) =>
                _crearItem(context, productosBloc, productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductosBloc productosBloc,
      ProductoModel producto) {
    return Dismissible(
        key: UniqueKey(),
        background: Container(color: Colors.red[300]),
        onDismissed: (direccion) {
          // productosProvider.borrarProducto(producto.id);
          productosBloc.borrarProducto(producto.id);
        },
        child: Card(
            child: Column(
          children: [
            (producto.fotoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                    image: NetworkImage(producto.fotoUrl),
                    placeholder: AssetImage('assets/jar-loading.gif'),
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ListTile(
              title: Text("${producto.titulo} - ${producto.valor}"),
              subtitle: Text(producto.id),
              onTap: () =>
                  Navigator.pushNamed(context, 'producto', arguments: producto),
            ),
          ],
        )));
  }
}
