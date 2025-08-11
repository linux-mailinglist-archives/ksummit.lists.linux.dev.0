Return-Path: <ksummit+bounces-2121-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA61EB2191E
	for <lists@lfdr.de>; Tue, 12 Aug 2025 01:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCDF77B06B7
	for <lists@lfdr.de>; Mon, 11 Aug 2025 23:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F6E1F12E0;
	Mon, 11 Aug 2025 23:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2xeqDV1"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46A21DED7B
	for <ksummit@lists.linux.dev>; Mon, 11 Aug 2025 23:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754954543; cv=none; b=A5UbQA3IBvqdx0O40PM5XKSQDhkV8ySjpu6t5v+btElzMz3GG98ENZkzDme255/fDN29hAu6naXPnLunqXS7v2DK5tDfX2vqQu/CADde7mAf7MzLvHXdbmN/cRgTkgbgHC8T/zaFf3DDBUC7241voPaWOlutilx+QOlHSVjZoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754954543; c=relaxed/simple;
	bh=inF6EVKJ0SrkEETtB4NmrkbEFRNqIt0y7BS2GwwTW34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDDbdfB9/AJwZToDB4GKptq9SVKbn31oznwQeKVPOF82sQn2/u72bmhqhymRZNMyVNCZ4zaUlQTcL4FLqWEG9JT0w34LnBIl13zTb4Cmk2bYWEJKTsDwiffLtwT3fGYeuoqOiyRS9heW+aZsitHDCzWymdDzedmoxeAapBak7Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2xeqDV1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183A7C4CEED;
	Mon, 11 Aug 2025 23:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754954543;
	bh=inF6EVKJ0SrkEETtB4NmrkbEFRNqIt0y7BS2GwwTW34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2xeqDV1coczTRrpmyjAusUnm3+4xZjApJLMlYm/C1j+t57Rz647zxWuKT5z2AxvP
	 Vu1za4kWFs66crj+9tzNvnZOMGW6wO+KWVkShxsIOOK6/N9DC0vP1+ED/H3cYn/ZFZ
	 suOvZB6vjGNi1xHZW3IDyRsylP2QgwDQJZWR0DD3P6xlN1d3YvjMbxB4i0xE3ShZrN
	 V6VzZYamTVwsABofUfBR/iaxqkqcWzRuxFIwMI+ZeyQWrUSsSrh1fVxDOri/8ofCad
	 9YREJthhpUzL1CO2JT4Rp8k7ssBYgOHD4dpdIx/mNQaHh4ITda2LOS70rXDkf6kPaZ
	 bnpDdud1US0og==
Date: Mon, 11 Aug 2025 16:22:21 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sasha Levin <sashal@kernel.org>,
	Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] Annotating patches containing AI-assisted
 code
Message-ID: <aJp7LbfETVBH5L0A@bombadil.infradead.org>
References: <1npn33nq-713r-r502-p5op-q627pn5555oo@fhfr.pbz>
 <aJJEgVFXg4PRODEA@lappy>
 <12ded49d-daa4-4199-927e-ce844f4cfe67@kernel.org>
 <f482c860-c6b2-4c5b-baa8-b546761debdf@paulmck-laptop>
 <aJpqo48FgDLglg-p@bombadil.infradead.org>
 <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9122886-701f-46b6-9616-24b31f2dd44c@paulmck-laptop>

On Mon, Aug 11, 2025 at 03:51:48PM -0700, Paul E. McKenney wrote:
> On Mon, Aug 11, 2025 at 03:11:47PM -0700, Luis Chamberlain wrote:
> > b) seems kind of too late
> 
> Why?

One cannot assume at this point AI generated code has not been merged
into any large scale open source project.

I am also not sure it can be stopped.

> > c) If something like the Generated-by tag is used, and we trust it, then
> >    if we do want to side against merging AI generated code, that's perhaps our
> >    only chance at blocking that type of code. Its however not bullet proof.
> 
> Nothing is bullet proof.  ;-)

Agreed, and I think the legal concerns over AI code use are just as weak. I
just don't see it holidng up long term.

My expectations are that eventually foundation AI models will simply state they
use permissively licensed code for training, and be done with these concerns.

Until then -- we just have wild speculations and I can't see any
sensible case ending up in court wanting to avoid AI code in open source.

> At the same time, I have no idea whether or not a Generated-by tag is
> a good idea.

I do that to make it crystal clear for a project maintainer when I use it.

  Luis

