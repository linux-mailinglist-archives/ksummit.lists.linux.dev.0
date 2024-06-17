Return-Path: <ksummit+bounces-1307-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FAA90B5BC
	for <lists@lfdr.de>; Mon, 17 Jun 2024 18:04:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E173282357
	for <lists@lfdr.de>; Mon, 17 Jun 2024 16:04:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 249D84A09;
	Mon, 17 Jun 2024 16:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aw4Gy9bm"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37C5DDC5
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 16:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718640256; cv=none; b=Hlji90eYTVHdCUPIvuf2L+kVxb7Ax/o27MejKnwvYfwW76iYswpk+M2sq75uyhgjO7Nj18weadi9w0vYF8LkIRhzSq14G13WarhZLkx3VslaphxKgzKcjDd3vZlf5XHlbH039AriVf5U9RoN1XKteFLFOo14u1ea4FItR5hZJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718640256; c=relaxed/simple;
	bh=raJSAvfHXqdaRhObDDIgZGGrvb3emofhphPN2yu3rpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFmISX+BXN9Do6zhWmHwlzHE/3kY6K3mBzd6vOLNg9rc81OvZY71FXFJfA6eG8vvm8sDMSlmooonOE+onExsMmqexEF73/CeV2a5CQA0PB/FtYkyYpxKmVzisjqBQgMxRmBkjvo0GjZf7OH1bvH6UC+9vnWpaMXyIegOBHrmARI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aw4Gy9bm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFE5C2BD10;
	Mon, 17 Jun 2024 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718640256;
	bh=raJSAvfHXqdaRhObDDIgZGGrvb3emofhphPN2yu3rpI=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=aw4Gy9bmACdDwGEWSnHS3/CxVMH7dEJ1BvEH+hrQ59biASX7a2ZEPIOG6cdojWKbY
	 fVNzjeJO/QdZ/t4J5MNquLdNjwQCWKvTasi/eom4znitvRtGMgbkKpOuSKsfMHQM7L
	 Tra0WkxAj9ycn7jQ26CwMoqgXA4ufoG0TKjzVyAiSszXVPHXRopff1gNyYh0rwLOmT
	 7EzXN521dtUrPGRANgIJZ6ljvoJB5mMhdA4khnHhCPb7QVpcSyhp6+tP5co+bZ18i7
	 IIQeOmcyG6M1LKPVwvhZZdoc6ijJAF8roCsh7CvazHUHofsL9fwMqDqbynmBcuU3kC
	 TA4dGSVs4qAPA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id A36E0CE09F5; Mon, 17 Jun 2024 09:04:15 -0700 (PDT)
Date: Mon, 17 Jun 2024 09:04:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>,
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <1ff23e26-0099-4826-bb79-4928507edce1@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>

On Mon, Jun 17, 2024 at 10:39:14AM -0400, Konstantin Ryabitsev wrote:

[ . . .]

> I understand the reasons why everyone hates having the "Message-ID:" trailer,
> and this is fine. Can I counter-propose that we have a unique URL for links
> specifically going to patch submissions from which the commits were made? I've
> been already recommending using the "msgid.link" domain, but I'll go a bit
> further and put forward the recommendation that:
> 
> - commits MAY have Link: trailers indicating the exact origin of the patch. To
>   distinguish these links from other Link: trailers that may lead to relevant
>   online discussions, they should either use the "patch.msgid.link" domain, or 
>   indicate the nature of the link using the hash-notation. Examples:
> 
>   - Link: https://patch.msgid.link/message@id-here
>   - Link: https://lore.kernel.org/message@id-here # patch

So for your message that I am replying to, this would be like these?

  - Link: https://patch.msgid.link/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat
  - Link: https://lore.kernel.org/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch

Or am I confusing keywords with variables in your canonical URLs?

If so, could you please post an example?

							Thanx, Paul

