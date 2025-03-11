/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function pagger(id, pageIndex, totalPage,gap)
{
    var container = document.getElementById(id);
    var content = '';
    
    if(pageIndex > gap + 1)
            content += '<a href="list?page=1">First</a>';
    
    if(pageIndex - gap>2)
            content += '<span>...</span>';
    
    for (var i=pageIndex - gap;i < pageIndex;i++)
    {
        if(i>0)
            content += '<a href="list?page='+i+'">'+i+'</a>';
    }
    
    content += '<span>'+pageIndex+'</span>';
    
    for (var i = pageIndex + 1;i <= pageIndex + gap; i++)
    {
        if(i<= totalPage)
            content += '<a href="list?page='+i+'">'+i+'</a>';
    }
    
    if(pageIndex + gap <= totalPage - 2)
            content += '<span>...</span>';
        
    if(pageIndex < totalPage - gap)
            content += '<a href="list?page='+totalPage+'">Last</a>';
    
    container.innerHTML = content;
    
}