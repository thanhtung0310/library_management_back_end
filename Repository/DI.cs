namespace library_management_ba.Repository
{
  public class DependencyInjection
  {
    public static void InjectService(IServiceCollection services)
    {
      services.AddScoped<IGetService, GetService>();
      services.AddScoped<IPostService, PostService>();

      services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
    }
  }
}