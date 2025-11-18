Return-Path: <ksummit+bounces-2637-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE5EC6BA8D
	for <lists@lfdr.de>; Tue, 18 Nov 2025 21:43:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 649D228B6B
	for <lists@lfdr.de>; Tue, 18 Nov 2025 20:43:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05B483002A4;
	Tue, 18 Nov 2025 20:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="ab0gy/pi"
Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CC92FD68F;
	Tue, 18 Nov 2025 20:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763498599; cv=none; b=RQYdp4506g1hJbRsGyr4KrY6/ZKybr3z6qwULxqt3s3e4j6Ig0ut+Ga9imCYp0dK4WbEldMsE03sqrrNwaudD+TaO0IbCmlBIQf1aUHZb6vZhdVIRdL7amQEmQM/ke3LYDsHoNCzaj3TG4m8ZeORGb/VzdktolfNhnhFlXE7e+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763498599; c=relaxed/simple;
	bh=CLxCkIresM4rJ5FOYwlcQC6SbocX6GNJRYHm8pv4mv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ezdk6DqbQc9/XzUKg5FI2d3HsruWbgQ1tpsBfch2sfTblKrHBPyFVeTJONGI0vchrBBaHk6tHiacCAxKrxrGbLNWFXR/5K7UuIF2xA6mCxhXU1olXBTXrLJGqeN0yN3oS2hBoEAnas80g/QudMvpdnyJxuVF/uB4LRzzYf8Y9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=ab0gy/pi; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=I6hnrer5rI/LadbRLuGZ1ZrUtwQrTIxvQtGMVHru0DU=; b=ab0gy/pihq4YHMeFKh7WIa0Lk5
	ZP1JakeKgAc/2V45P+CTIwuMucWL1/GPhKzWnUFg5QVqAer+V7XEV+pKZug6RWWwwJVkSPkonmNtk
	oLCBZRNjeqQvL5VgrqAd7aoFbLr6ECetfvTdxqtSi0DIgAS7Hz0OAKs5Xba7LAjg3b0cx1tR5VPGe
	7p7yqjvkzDT2+DBBhrXkRMpligRNz+ECbS5b95Cv4iUkTTslnFZaqtIXECcPM06f9BEMxTLWl2dAX
	oNnh7bVNnTD1N0XTgCQ2b5tBOlOZUyb3ZU3sj26Ky8IWhwX7dqfHhBbZbcOdkotPCB+zlCLfDtxXz
	lKBZJHOQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLSXh-0000000G39C-2u9A;
	Tue, 18 Nov 2025 20:43:13 +0000
Date: Tue, 18 Nov 2025 20:43:13 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Dan Williams <dan.j.williams@intel.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: Clarifying confusion of our variable placement rules caused by
 cleanup.h
Message-ID: <20251118204313.GI2441659@ZenIV>
References: <58fd478f408a34b578ee8d949c5c4b4da4d4f41d.camel@HansenPartnership.com>
 <f63891cb-13e7-443f-bf02-5a357aa2a70b@acm.org>
 <CAHk-=wiCOTW5UftUrAnvJkr6769D29tF7Of79gUjdQHS_TkF5A@mail.gmail.com>
 <82a250e0-de9e-467a-882e-7acefbfd7c24@acm.org>
 <CAHk-=wh3pguds+vjKy81X2o0uJj+AhwpMu2=mf6jciQjEQ781Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh3pguds+vjKy81X2o0uJj+AhwpMu2=mf6jciQjEQ781Q@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, Nov 18, 2025 at 11:14:21AM -0800, Linus Torvalds wrote:

> It's not exactly uncommon to have code like this:
> 
>     struct xyz *abc = kzalloc(sizeof(struct xyz), GPF_KERNEL);
> 
> and I don't think there's any actual *value* in stating that "struct
> xyz" twice (or in stating the sizeof()).

Depends...  "Need to find all places where we have struct xyz instances
allocated" does happen on code audit; making it harder to find...

Pet peeve: I really wish we had a decent way to say that pointers to
this particular type are _not_ to be converted without an explicit
(and searchable) cast...   Tricks like wrapping pointer into a struct
do work to an extent, but not when you need to dereference it in a lot
of places ;-/

