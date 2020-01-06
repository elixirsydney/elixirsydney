defmodule Demo13.MeetupsTest do
  use Demo13.DataCase

  alias Demo13.Meetups
  alias Demo13.Meetups.Meetup

  @create_attrs %{date: ~D[2010-04-17], description: "some description", location: "some location", title: "some title"}
  @update_attrs %{date: ~D[2011-05-18], description: "some updated description", location: "some updated location", title: "some updated title"}
  @invalid_attrs %{date: nil, description: nil, location: nil, title: nil}

  def fixture(:meetup, attrs \\ @create_attrs) do
    {:ok, meetup} = Meetups.create_meetup(attrs)
    meetup
  end

  test "list_meetups/1 returns all meetups" do
    meetup = fixture(:meetup)
    assert Meetups.list_meetups() == [meetup]
  end

  test "get_meetup! returns the meetup with given id" do
    meetup = fixture(:meetup)
    assert Meetups.get_meetup!(meetup.id) == meetup
  end

  test "create_meetup/1 with valid data creates a meetup" do
    assert {:ok, %Meetup{} = meetup} = Meetups.create_meetup(@create_attrs)
    assert meetup.date == ~D[2010-04-17]
    assert meetup.description == "some description"
    assert meetup.location == "some location"
    assert meetup.title == "some title"
  end

  test "create_meetup/1 with invalid data returns error changeset" do
    assert {:error, %Ecto.Changeset{}} = Meetups.create_meetup(@invalid_attrs)
  end

  test "update_meetup/2 with valid data updates the meetup" do
    meetup = fixture(:meetup)
    assert {:ok, meetup} = Meetups.update_meetup(meetup, @update_attrs)
    assert %Meetup{} = meetup
    assert meetup.date == ~D[2011-05-18]
    assert meetup.description == "some updated description"
    assert meetup.location == "some updated location"
    assert meetup.title == "some updated title"
  end

  test "update_meetup/2 with invalid data returns error changeset" do
    meetup = fixture(:meetup)
    assert {:error, %Ecto.Changeset{}} = Meetups.update_meetup(meetup, @invalid_attrs)
    assert meetup == Meetups.get_meetup!(meetup.id)
  end

  test "delete_meetup/1 deletes the meetup" do
    meetup = fixture(:meetup)
    assert {:ok, %Meetup{}} = Meetups.delete_meetup(meetup)
    assert_raise Ecto.NoResultsError, fn -> Meetups.get_meetup!(meetup.id) end
  end

  test "change_meetup/1 returns a meetup changeset" do
    meetup = fixture(:meetup)
    assert %Ecto.Changeset{} = Meetups.change_meetup(meetup)
  end
end
