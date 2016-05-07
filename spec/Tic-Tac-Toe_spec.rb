require_relative '../Tic-Tac-Toe'

describe "Board" do
	describe ".is_game_over" do

		context "x on top row" do
			before do
				@board = Board.new([1, 1, 1, 0, 0, 0, 0, 0, 0] , 0) 
			end

			it "x wins horizontally" do
				expect(@board.is_game_over).to eq(true)
			end
		end

		context "x is diagonal" do
			before do
				@board = Board.new([1, 0, 0, 0, 1, 0, 0, 0, 1] , 0)
			end
			
			it "x wins diagonally" do
				expect(@board.is_game_over).to eq(true)
			end
		end

		context "x can't win" do
			before do 
				@board = Board.new([0, 0, 0, 0, 0, 0, 0, 0, 0] , 0)
			end

			it "x does not win" do
				expect(@board.is_game_over).to eq(false)
			end
		end

		context "O on top row" do
			before do
				@board = Board.new([2, 2, 2, 0, 0, 0, 0, 0, 0] , 1) 
			end

			it "O wins horizontally" do
				expect(@board.is_game_over).to eq(true)
			end
		end

		context "O is diagonal" do
			before do
				@board = Board.new([2, 0, 0, 0, 2, 0, 0, 0, 2] , 1)
			end
			
			it "O wins diagonally" do
				expect(@board.is_game_over).to eq(true)
			end
		end

		context "O can't win" do
			before do
				@board = Board.new([0, 0, 0, 0, 0, 0, 0, 0, 0] , 1)
			end

			it "O does not win" do
				expect(@board.is_game_over).to eq(false)
			end
		end

		context "tests legal placement with blank board" do
			before do
				@game = Board.new
			end

			it "should allow a placement of 3" do
				expect(is_legal_placement(3, @game)).to eq(true)
			end

			it "should not allow a placement of 0" do
				expect(is_legal_placement(0, @game)).to eq(false)
			end
		end

		context "shouldn't allow placement on a taken spot" do
			before do
				@game = Board.new([1] + [0]*8)
			end

			it "should not allow a placement on first square" do
				expect(is_legal_placement(1, @game)).to eq(false)
			end


			it "should allow placement on second square" do
				expect(is_legal_placement(2, @game)).to eq(true)
			end
		end
	end
end