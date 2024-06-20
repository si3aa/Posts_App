import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'core/network/network_info.dart';
import 'features/posts/data/data_sourses/post_local_data_source.dart';
import 'features/posts/data/data_sourses/post_remote_data_source.dart';
import 'features/posts/data/repository/posts_repo_ipm.dart';
import 'features/posts/domain/repo/posts_repo.dart';
import 'features/posts/domain/use_cases/add_posts.dart';
import 'features/posts/domain/use_cases/delete_posts.dart';
import 'features/posts/domain/use_cases/get_all_posts.dart';
import 'features/posts/domain/use_cases/updata_posts.dart';
import 'features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
//Bloc
  sl.registerFactory(() => PostsBloc(getAllPosts: sl()));
  sl.registerFactory(() => AddDeleteUpdatePostBloc(
      addPost: sl(), deletePost: sl(), updatePost: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => AddPostsUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostsUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostsUseCase(sl()));

  // Repository
  sl.registerLazySingleton<PostsRepository>(() => PostsRepositoryIpm(
      localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));

  // DataSources
  sl.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client());
   sl.registerLazySingleton(() => InternetConnectionChecker());
}
