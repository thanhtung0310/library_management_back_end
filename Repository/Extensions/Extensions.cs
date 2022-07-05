namespace library_management_ba.Repository.Extensions
{
  using System;
  using System.Data;
  using Dapper;
  public static class DapperExtensions
  {
    public static DynamicParameters AddParam(this DynamicParameters dynamicParameter, string paramName, object? value, DbType? dbType = null, ParameterDirection? direction = null, int? size = null, byte? precision = null, byte? scale = null)
    {
      if (dynamicParameter == null)
      {
        throw new Exception("Unable to detect DynamicParameters.");
      }

      dynamicParameter.Add(paramName, value, dbType, direction, size, precision, scale);

      return dynamicParameter;
    }
  }
}