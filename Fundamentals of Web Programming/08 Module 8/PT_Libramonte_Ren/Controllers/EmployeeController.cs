using Microsoft.AspNetCore.Mvc;

namespace PT_Libramonte_Ren.Controllers
{
    public class EmployeeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
