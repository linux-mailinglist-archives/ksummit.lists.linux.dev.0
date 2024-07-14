Return-Path: <ksummit+bounces-1400-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C5D930B3D
	for <lists@lfdr.de>; Sun, 14 Jul 2024 20:47:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8911B20E6D
	for <lists@lfdr.de>; Sun, 14 Jul 2024 18:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F319713BAE9;
	Sun, 14 Jul 2024 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qOT5RYM/"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72247FC11
	for <ksummit@lists.linux.dev>; Sun, 14 Jul 2024 18:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720982824; cv=none; b=duE4Aoj2Oiq1iUIJ/1ip0gntAfG9zbeN2+ziKEHYsEflH9A4Rd9DbwvisOrETqePsiztWVzy/Bpziy0Mul9dG/1oLo7NdN1774bKURHaqFy+e5kr4EKP2F07lDqF7ysEoybpSZ2/Ez8cBJxe7NZwSIGfSgcDuUkHQwHUmKt3LM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720982824; c=relaxed/simple;
	bh=7YJdOvlkUTfLEAP4HDHA8i626beRAL9M3JvGAmtQdRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D2xmtkcppd0u99lhsiPfqt5QcpcOS+bPZX88NM6tqhebYABYEHqVeD6K4VxPseWzQWl9G3cNIrN+l8FYdQcmgVkiRCrWbtcqOPVI0+XLWKxUaTwHeKFd/5BcudIw68Gl3ueZfz8kiYNwW3ib0Z/dYPDtZSRsjhQeNdR+ZYLR3YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qOT5RYM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D13C116B1;
	Sun, 14 Jul 2024 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720982824;
	bh=7YJdOvlkUTfLEAP4HDHA8i626beRAL9M3JvGAmtQdRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOT5RYM/tMhR/zsIGmIrttIkDKl5dMbVbcL/VK7KPrWh9jLl/8NOO0+fcsquJfiTK
	 wscCg95AXxu1ZBKiatgL4fYMB8DEop191XFfeq9l3vt2QHN9UP7+AM8qD6oZ8O51XF
	 6pXHprWifrl2tifXDyiR2P44dwQLV6473Wsv31Lneb/+JCwSSftkJr0kEnFu4hPoRF
	 VH3yFkBWxDD8K+2ys7si48acaxalX369gOkiEhnJHeO8Uw6D72cMqIk8OWo+WwMOZ2
	 hiTVmnaugsA1VIJ4E77kuAn5tB9j3KdcCY3MPAs8RA21PjQVWgt9wks7jmpOxxcBBY
	 1geInKhPhvqqw==
Date: Sun, 14 Jul 2024 14:47:02 -0400
From: Sasha Levin <sashal@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpQdJpKhIzmf3veU@sashalap>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>

On Sun, Jul 14, 2024 at 10:07:48AM -0700, Linus Torvalds wrote:
>On Sun, 14 Jul 2024 at 05:31, Sasha Levin <sashal@kernel.org> wrote:
>>
>> One of the main issues is that most Fixes-tagged commits (>80%) end up
>> in a stable tree, leading some authors to omit the Stable tag
>> altogether.
>
>So as others have said, the fix to two confusing tags is not to
>introduce *more* tags. That only adds to the confusion.
>
>I honestly personally will likely not ever use any more tags than the
>ones we already have. Every single "let's add a new tag" proposal I've
>ever seen has been pure garbage.
>
>People see one problem and want to fix it by introducing a tag, and
>think tags magically would fix it, when adding more tags will only
>cause more confusion and make the existing tags less obvious.

I'm not trying to add an additional tag, but rather replace a "broken"
tag by adding something that is better aligned with how people are doing
things these days.

For that matter, we can look at Linus Torvalds, a prominent Linux
developer. In the past few years, Linus has authored:

  - 2023: 3 stable tagged commits.
  - 2022: 2 stable tagged commits.
  - 2021: 4 stable tagged commits.
  - 2020: 0 stable tagged commits.

If we all agree that Linus authored more stable-worthy commits than
that, then to me it's an indication that the stable tagging system isn't
working well here.

My thinking was that we can stop nagging folks about adding a stable tag
and leverage their current (positive) behavior around adding fixes tags,
but yes - training folks to use a new tag is hard.

What's the path forward here? Stable tags don't work, "Improves:" tag
might indeed be garbage, so what would make the folks who read this
mailing list more consistent about tagging patches they author for
backport?

-- 
Thanks,
Sasha

