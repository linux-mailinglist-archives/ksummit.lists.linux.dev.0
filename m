Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E69A7D6094
	for <lists@lfdr.de>; Wed, 25 Oct 2023 05:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B93D5281C16
	for <lists@lfdr.de>; Wed, 25 Oct 2023 03:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C5F749E;
	Wed, 25 Oct 2023 03:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LMP7LJAi"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D8317CA;
	Wed, 25 Oct 2023 03:47:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4FC433C7;
	Wed, 25 Oct 2023 03:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698205649;
	bh=18azceFRMX/oceP/sEAH9bN0s6aR4xXK/ZFTQgQvv3g=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LMP7LJAi/qovQ2DPskRPu10/ETDNl6/88ltAsJq7ZiTCANWA9RXu+b5JuEemL09JH
	 7mVBDgWSZ9NfVH211IRRvjk8Ah1kCImVz0SwohWciUYt4qrAuWTRKH2GF14wnT93BM
	 rlaxldXvnXnjMdfJjj6/KmPdceheMy+SrYfdZAvsciLwdefhJdUXCHb3Qv/l6jM4Go
	 prJbeOdBumakGJizxh2zO+6RL83Hfe3pfyHQZ2npIiLL7/TENaFsuzKg0vsThw748X
	 zjbnAdmK+LozyhW5bPcEXL+NJAosboGa1Z2GPOA1h734vnkebbXHwpdnLGXWVmbvGM
	 zjqWXlEuZ7dmg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id BE971CE0B6E; Tue, 24 Oct 2023 20:47:28 -0700 (PDT)
Date: Tue, 24 Oct 2023 20:47:28 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: NeilBrown <neilb@suse.de>, Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>, ksummit@lists.linux.dev,
	outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: Re: KTODO automated TODO lists
Message-ID: <92cff666-c948-457a-8aa6-967e624a3d37@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
 <20231023114949.34fc967988c354547f79c4e7@linux-foundation.org>
 <8ca50d4c-3c96-4efa-a111-fca04d580ab5@kernel.org>
 <169818295461.20306.14022136719064683486@noble.neil.brown.name>
 <20231024180517.421618c0@gandalf.local.home>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231024180517.421618c0@gandalf.local.home>

On Tue, Oct 24, 2023 at 06:05:17PM -0400, Steven Rostedt wrote:
> On Wed, 25 Oct 2023 08:29:14 +1100
> "NeilBrown" <neilb@suse.de> wrote:
> 
> > Here we all are, brilliantly talented computer programmers who spend
> > our days making amazing fast digital devices do amazingly clever and
> > subtle things, inventing time-saving tools and processing vast amounts
> > of data without blinking, but for some reason we think the task of
> > skipping over a few thousand lines that all start with '> " is too hard
> > for us and that we should, in stead, complain to some other human to
> > convince them to make our life easier for us.
> > 
> > Does anyone else see the irony?
> 
> Did you also know that real-time developers are the most unpredictable?

Are safety-critical programmers the most easy-going?

							Thanx, Paul

