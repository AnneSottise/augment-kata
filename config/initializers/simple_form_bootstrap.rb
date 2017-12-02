# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.error_notification_class = 'alert alert-danger'
  config.button_class             = 'btn btn-secondary'
  config.boolean_label_class      = nil
  config.boolean_style            = :inline

  config.wrappers :form, tag: 'div', class: 'form-group row', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.optional :maxlength
    b.optional :pattern
    b.optional :min_max
    b.optional :readonly
    b.use :label, class: 'col-xs-2 col-form-label'

    b.wrapper tag: 'div', class: 'col-xs-10' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :composition, tag: 'div', class: 'form-group row', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder

    b.wrapper tag: 'div', class: 'col-xs-12' do |ba|
      ba.use :input, class: 'form-control'
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.default_wrapper = :form
end
