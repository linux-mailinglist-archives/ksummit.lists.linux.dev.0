Return-Path: <ksummit+bounces-280-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [147.75.69.165])
	by mail.lfdr.de (Postfix) with ESMTPS id 235DE3BE3F6
	for <lists@lfdr.de>; Wed,  7 Jul 2021 09:52:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id EC8E63E1040
	for <lists@lfdr.de>; Wed,  7 Jul 2021 07:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564CE2FAD;
	Wed,  7 Jul 2021 07:52:28 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com [96.44.175.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D85770
	for <ksummit@lists.linux.dev>; Wed,  7 Jul 2021 07:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bedivere.hansenpartnership.com (Postfix) with ESMTP id 8E2BC128067A;
	Wed,  7 Jul 2021 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625644346;
	bh=dekjwix0ZVo3+MomZgDtuqeJ7gB7V9RyN2lG8dmqHsg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=DYhGARGu94Et2wkDpyrsOTNiWaJniwmTawvioraaqhm6cezrc4KUhVZIktcWdNrOS
	 Vl/pEpZ2vBXOHmNE5vurcg5HgKtk9jFfPxbv2Rpwl4gY/oiqqksZ0M3zxwIjXQsQV6
	 2et0ZD8U/StQ+yn1ZFatc+W7Zob7S/SM7POpt6IM=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
	by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2t6RLptXauiN; Wed,  7 Jul 2021 00:52:26 -0700 (PDT)
Received: from [192.168.0.73] (cpc1-seac25-2-0-cust181.7-2.cable.virginm.net [82.8.18.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id A01D2128066E;
	Wed,  7 Jul 2021 00:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1625644346;
	bh=dekjwix0ZVo3+MomZgDtuqeJ7gB7V9RyN2lG8dmqHsg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=DYhGARGu94Et2wkDpyrsOTNiWaJniwmTawvioraaqhm6cezrc4KUhVZIktcWdNrOS
	 Vl/pEpZ2vBXOHmNE5vurcg5HgKtk9jFfPxbv2Rpwl4gY/oiqqksZ0M3zxwIjXQsQV6
	 2et0ZD8U/StQ+yn1ZFatc+W7Zob7S/SM7POpt6IM=
Message-ID: <20ad13eb229b15fd14d870832d43a1605ba5c24a.camel@HansenPartnership.com>
Subject: Re: [TECH TOPIC] Rust for Linux
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Greg KH <greg@kroah.com>, Julia Lawall <julia.lawall@inria.fr>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij
 <linus.walleij@linaro.org>, Roland Dreier <roland@kernel.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Date: Wed, 07 Jul 2021 08:52:22 +0100
In-Reply-To: <YOVbsS9evoCx0isz@kroah.com>
References: 
	<CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
	 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com>
	 <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
	 <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
	 <YOTSYy2J2COzOY9l@pendragon.ideasonboard.com>
	 <alpine.DEB.2.22.394.2107070926370.6285@hadrien>
	 <YOVbsS9evoCx0isz@kroah.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-07 at 09:45 +0200, Greg KH wrote:
> On Wed, Jul 07, 2021 at 09:27:32AM +0200, Julia Lawall wrote:
[...]
> > Where should the free have been?  Will Rust help in this
> > case?  Will it result in a memory leak?
> 
> This is going to be the "interesting" part of the rust work, where it
> has to figure out how to map the reference counted objects that we
> currently have in the driver model across to rust-controlled objects
> and keep everything in sync properly.

Rust has a reference counted pointer: Rc<T>.  However the problem is
the rust memory model is via strict accounting, so once you start using
refcounts, which need shared accounting, you can then get memory leaks
and it's unclear if rust actually buys you anything over C for this use
case.

James



