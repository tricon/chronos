Time::DATE_FORMATS.merge!(
  { long_ordinal_with_time: lambda { |date| day_format = ActiveSupport::Inflector.ordinalize(date.day); date.strftime("%B #{day_format}, %Y %l:%M %p %Z") },
    long_ordinal_date: lambda { |date| day_format = ActiveSupport::Inflector.ordinalize(date.day); date.strftime("%B #{day_format}, %Y") }})