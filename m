Return-Path: <ksummit+bounces-1305-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC34F90B3CD
	for <lists@lfdr.de>; Mon, 17 Jun 2024 17:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93B371F29EE2
	for <lists@lfdr.de>; Mon, 17 Jun 2024 15:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71D3215ADA0;
	Mon, 17 Jun 2024 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OsrMlPT4"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995C415991E
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 14:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718635156; cv=none; b=Hvi73jh976QZTj1LvE+sOrCuEeQDfi9A+8qScU9TaZUFpMF1t99eB+wHuhDHeQzOS7NXcFd1hE3pQ4zFFLJdjmlhcTyHelXMBuUWGBNU1KhHtmse1lbWqi5K59o1+1vWI2m+keTeHM0qEKFPDkonl0g5leq7aGC6SOW3zT8bubU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718635156; c=relaxed/simple;
	bh=Sg0j0U4f8yS+schIs4Ghz+5UNYHGckAJn6LafjXU4uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRmh2jOROB+fqLKG4+DVr4fGp/xZyZGVNJKoFvt3F58CqASDv04fPPLFOAa8xhlTQt5rj1me0LNVK0MbxarmRGmB7Xpx0EPFvfOuQVPOWy1yo6OOJS9+o9oCm9TEvRio+p8UKYmbgXT0ALXJuFfA0QvayTOyBqoyAgJbUzHb9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OsrMlPT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA560C4AF1D;
	Mon, 17 Jun 2024 14:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718635156;
	bh=Sg0j0U4f8yS+schIs4Ghz+5UNYHGckAJn6LafjXU4uM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OsrMlPT40Pkl9XHdDv5GFZMS/K7ShK1wNrtKMJiUfHA6vufFbtqgdo7CmTxwo3wPL
	 LjGThg47y/R3x/BkDIpBwJs46zbCMcY4M8pY04TYjTKyvxtqw3Trmvk5OLpxVIfrBK
	 EHuphD3Sn3igUvQOapMayvA7tCZxL3xXS1hhGkqE=
Date: Mon, 17 Jun 2024 10:39:14 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>

On Sat, Jun 15, 2024 at 09:59:40PM GMT, Linus Torvalds wrote:
> And finally - if you applied the patch by just following a message ID
> with basically "b4" from lore, I think the source link is almost
> entirely worthless.

I have to continue to disagree here. I need something *reliable* for
automation to work. If automation fails even 10% of the time, it generates
confusion. I have lots of reports from people where b4 was able to match 9 out
of 10 commits because the author changed something minor in patch 8/10, and so
the patch-id no longer matched. As a result, committers follow up with "why
didn't you apply 8/10" and the maintainers then have to reply with "oh, I did,
but b4 got confused."

Message-IDs are the perfect solution to this problem -- they are a reliable
mechanism to match a commit to the patch where it came from. I don't care if
they are part of the Link: trailer, but I do care to know *which one* of the
Link: trailers point at the original submission. If there are multiple Link:
trailers pointing at lore, one for the patch submission, and another for a
series dependency, discussion, or an alternative implementation of the same
thing, then I no longer have a reliable course of action.

> Here's the thing: if you applied it unchanged from lore, you already
> have the email address and a date in the commit.
> 
> Are you seriously saying that you can't find it based on that?

There are situations where this is unreliable for automation:

- the patch has the "From:" header inside the body that is different from the
  "From:" message header (this is why this would fail most commonly)
- the patch has a "Date:" or "Subject:" headers inside the body that override
  the "Date:" or "Subject:" headers in the message
- the author sends the series to a test list
- the author sends the series for a pre-review to the newbies list ("hey, can
  someone quickly confirm that this looks good?")
- the author sends the series to the wrong list, and then corrects themselves
  and sends it to the correct list
- the author sends the same patch as part of multiple series, in the hopes
  that one of them gets through

All of these cases would cause automation to fail.

I understand the reasons why everyone hates having the "Message-ID:" trailer,
and this is fine. Can I counter-propose that we have a unique URL for links
specifically going to patch submissions from which the commits were made? I've
been already recommending using the "msgid.link" domain, but I'll go a bit
further and put forward the recommendation that:

- commits MAY have Link: trailers indicating the exact origin of the patch. To
  distinguish these links from other Link: trailers that may lead to relevant
  online discussions, they should either use the "patch.msgid.link" domain, or 
  indicate the nature of the link using the hash-notation. Examples:

  - Link: https://patch.msgid.link/message@id-here
  - Link: https://lore.kernel.org/message@id-here # patch

This would satisfy both the need for automation to have a reliable way to find
the origin of the commit, and clearly indicate the nature of the link for
humans doing commit spelunking.

-K

