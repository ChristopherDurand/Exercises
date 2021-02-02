$(() => {
  todos = [
    { id: 1, title: 'Homework' },
    { id: 2, title: 'Shopping' },
    { id: 3, title: 'Calling Mom' },
    { id: 4, title: 'Coffee with John '}
  ];

  const todoListGenerator = Handlebars.compile($('#todo_list').html());
  const renderTodos = () => $('#todos').html(todoListGenerator({todos}));

  $('#context')
  renderTodos();

  const $popup = $('.popup');
  const $confirm = $('#confirm');
  const $todos = $('#todos');
  const $context = $('#context');
  const $body = $('body');

  $todos.on('click', 'a', function(e) {
    e.preventDefault();
    const todoId = $(e.target).parents('li').data('id');
    confirmDelete(todoId);
  });

  $todos.on('contextmenu', 'li', function(e) {
    e.preventDefault();
    const todoId = $(e.target).data('id');
    showContext(todoId, {left: e.pageX, top: e.pageY});
  });

  function confirmDelete(id) {
    $popup.show();
    $confirm.off('click').on('click', 'a', function(e) {
      e.preventDefault();
      if($(this).attr('class') === 'yes') {
        todos = todos.filter(todo => todo.id !== id);
      }
      $popup.hide();
      renderTodos();
    });
  }

  function showContext(id, offset) {
    $context.css(offset).hide().fadeIn(300);
    $(document).on('click', () => {
      $context.hide();
      $(document).off('click');
    });
    $context.off('click').on('click', 'a', function(e) {
      e.preventDefault();
      let actionTable = {
        delete: confirmDelete,
        details: showTodoDetails,
        edit: editTodo,
      };
      actionTable[$(this).data('action')](id);
    });
  }

  function showTodoDetails(id) {
    console.log('suck eggs');
  }
  function editTodo(id) {
    console.log('Pound Sand');
  }
});