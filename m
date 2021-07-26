Return-Path: <ksummit+bounces-467-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F063D5E59
	for <lists@lfdr.de>; Mon, 26 Jul 2021 17:50:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A9F231C06B9
	for <lists@lfdr.de>; Mon, 26 Jul 2021 15:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46A052FB2;
	Mon, 26 Jul 2021 15:50:41 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533F172
	for <ksummit@lists.linux.dev>; Mon, 26 Jul 2021 15:50:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1FFF60525;
	Mon, 26 Jul 2021 15:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627314639;
	bh=QOE1D8VOwWUK92RtEhhxecRWgQQQeWfWWga1+d9kH6I=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Fdgl+bIYL+nTEGnTPpXow0i5G7z8EwPhU7+SicQI8TD8jxDtF7IkVqCNjt6TuHA6N
	 jbkT9+T5tPnBthlD5hMRFLndvxGKfiyu+Ptpoqx+xrcD4/Y/R1JRrh8c4lSTDc2FXV
	 UHBlDhr8zDMx1I57+9oemEgIXhmP7TWmYgCp9ro7ORzhvcHGHBHMnu8wIpwzqaWy7W
	 UnVFxSEg7iJuqnRLTCg4VLvW+enQPzlRDbpiaYRsxwty+hpN1xMlFg5YgxiZDsKAwo
	 9mIpWoMs3zcLtegiO9gL7DC80l74NqdOKjV3LnPoV3Jkhme36AmAc6KfjfFyKDs0ZS
	 YJ4DhKpH/2cYw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 885545C06D2; Mon, 26 Jul 2021 08:50:39 -0700 (PDT)
Date: Mon, 26 Jul 2021 08:50:39 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ksummit@lists.linux.dev, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: Potential static analysis ideas
Message-ID: <20210726155039.GR4397@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20210723191023.GG25548@kadam>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723191023.GG25548@kadam>

On Fri, Jul 23, 2021 at 10:10:23PM +0300, Dan Carpenter wrote:
> Rust has many good static analysis features but if we wanted we could
> implement a number of stricter rules in C.  With Smatch I have tried to
> focus on exclusively on finding bugs because everyone can agree that
> bugs are bad.  But if some subsystems wanted to implement stricter rules
> just as a hardenning measure then that's a doable thing.
> 
> For example, I've tried a bunch of approaches to warning about when the
> user can trigger an integer overflow.  The challenge is that most
> integer overflows are harmless and do not cause a real life bug.

I would not want overflow checks for unsigned integers, but it might
be helpful for signed integers.  But yes, most of us rely on fwrapv,
so that kernelwide checks for signed integer overflow will be quite noisy.

							Thanx, Paul

