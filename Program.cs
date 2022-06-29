using Microsoft.EntityFrameworkCore;
using library_management_ba.Data;
using library_management_ba.Repository;
using Microsoft.Data.SqlClient;
using System.Data;

var builder = WebApplication.CreateBuilder(args);

// get connection String
var connectionString = builder.Configuration.GetConnectionString("WebApiDatabase");

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddDbContext<DatabaseContext>((options) =>
{
  options.UseSqlServer(connectionString);
});

DependencyInjection.InjectService(builder.Services);

// Add Singleton service
builder.Services.AddSingleton<IDbConnection>((db) => new SqlConnection(connectionString));

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
  app.UseDeveloperExceptionPage();
  app.UseSwagger();
  app.UseSwaggerUI();
}
else
{
  app.UseHsts();
}

app.UseCors(x => x
  .AllowAnyOrigin()
  .AllowAnyMethod()
  .AllowAnyHeader());

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllerRoute(
  name: "default",
  pattern: "{controller}/{action?}/{id?}"
);

app.Run();
