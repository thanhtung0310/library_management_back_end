namespace library_management_ba.Repository
{
  public class DependencyInjection
  {
    public static void InjectService(IServiceCollection services)
    {
      services.AddScoped<IService, Service>();
      services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
    }
  }
}