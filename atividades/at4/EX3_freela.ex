defmodule FreelancerRates do
    def daily_rate(hourly_rate) do
        hourly_rate * 8.0
    end

    def apply_discount(before_discount, discount) do
        ((100 - discount) / 100) * before_discount
    end

    def monthly_rate(hourly_rate, discount) do
        val = apply_discount(daily_rate(hourly_rate) * 22, discount)
        ceil(val)
    end

    def days_in_budget(budget, hourly_rate, discount) do
        val = budget / apply_discount(daily_rate(hourly_rate), discount)
        Float.floor(val , 1)
    end
end