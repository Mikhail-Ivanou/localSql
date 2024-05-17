import 'package:drift/drift.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_sql/data/db/db.dart';
import 'package:local_sql/data/db/goods_groups_table.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final MainDatabase db;

  SplashBloc(this.db) : super(SplashInitial()) {
    on<SplashInitEvent>((event, emit) async {
      final noData = await db.waiters.all().get();
      if (noData.isEmpty) {
        await db.waiters.insertAll(const [
          Waiter(name: "Anna"),
          Waiter(name: "Boris"),
          Waiter(name: "Max"),
          Waiter(name: "Serg"),
        ]);
        await db.places.insertAll(const [
          Place(name: "Table 1"),
          Place(name: "Table 2"),
          Place(name: "Table 3"),
          Place(name: "Table 4"),
          Place(name: "Outside 1"),
          Place(name: "Outside 2"),
        ]);
        await db.goodsGroups.insertAll(const [
          GoodsGroup(title: 'Закуски', type: GroupType.starter),
          GoodsGroup(title: 'Салаты', type: GroupType.starter),
          GoodsGroup(title: 'Рыбa', type: GroupType.main),
          GoodsGroup(title: 'Мясо', type: GroupType.main),
          GoodsGroup(title: 'Гарниры', type: GroupType.main),
          GoodsGroup(title: 'Горячие', type: GroupType.drinks),
          GoodsGroup(title: 'Холодные', type: GroupType.drinks),
          GoodsGroup(title: 'Алкоголь', type: GroupType.drinks),
        ]);
        await db.goodsItems.insertAll(const [
          GoodsItem(title: 'Бутерброд', group: 1, price: 4),
          GoodsItem(title: 'Сыр', group: 1, price: 8),
          GoodsItem(title: 'Овощи', group: 1, price: 5),
          GoodsItem(title: 'Копчености', group: 1, price: 9),
          GoodsItem(title: 'Цезарь', group: 2, price: 7),
          GoodsItem(title: 'Греческий', group: 2, price: 4),
          GoodsItem(title: 'Оливье', group: 2, price: 5),
          GoodsItem(title: 'Карп', group: 3, price: 9),
          GoodsItem(title: 'Семга', group: 3, price: 14),
          GoodsItem(title: 'Палтус', group: 3, price: 15),
          GoodsItem(title: 'Тунец', group: 3, price: 15),
          GoodsItem(title: 'Нагетсы', group: 4, price: 12),
          GoodsItem(title: 'Жаркое', group: 4, price: 13),
          GoodsItem(title: 'Стейк', group: 4, price: 14),
          GoodsItem(title: 'Язык', group: 4, price: 16),
          GoodsItem(title: 'Рулька', group: 4, price: 12),
          GoodsItem(title: 'Овощи на гриле', group: 5, price: 4),
          GoodsItem(title: 'Картошка фри', group: 5, price: 3),
          GoodsItem(title: 'Рис', group: 5, price: 3),
          GoodsItem(title: 'Чай', group: 6, price: 2),
          GoodsItem(title: 'Кофе', group: 6, price: 2),
          GoodsItem(title: 'Какао', group: 6, price: 2),
          GoodsItem(title: 'Вода', group: 7, price: 1),
          GoodsItem(title: 'Сок', group: 7, price: 2),
          GoodsItem(title: 'Кола', group: 7, price: 2),
          GoodsItem(title: 'Вино', group: 8, price: 3),
          GoodsItem(title: 'Пиво', group: 8, price: 3),
          GoodsItem(title: 'Водка', group: 8, price: 3),
          GoodsItem(title: 'Виски', group: 8, price: 4),
        ]);
      }
      await Future.delayed(const Duration(seconds: 2));
      emit(SplashSuccess());
    });
  }
}
