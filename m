Return-Path: <ksummit+bounces-1312-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B48E90CB18
	for <lists@lfdr.de>; Tue, 18 Jun 2024 14:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35A511C2366A
	for <lists@lfdr.de>; Tue, 18 Jun 2024 12:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F6F2770F9;
	Tue, 18 Jun 2024 12:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b="evSrnfea"
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D00206CDC0
	for <ksummit@lists.linux.dev>; Tue, 18 Jun 2024 12:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718712326; cv=none; b=Bp4pmA90sJP7kg1xiBYDJ7vVrSRjkKnCbmx/fP6Mv+zxkzzmkvypMJoUOLA/wetNpEpaEoGwLwU3Kmdre0714kj4oAdOsK9/vr72iK6PRetF02p4qQIKpafnol0A+nMYeTqNK+BD3Sn/TvPeQnHRuXDkGovXw/l/LrZb3TszYys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718712326; c=relaxed/simple;
	bh=h6fgNkGBkmeh/5MtnrGst2R9aa3vKsFYv+TTX9X9klk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JJausaCHwlGkFM9Wai8DafE2nfEJXYXwkzv8eZV9CeCvfqGOPGB8wQtZfjvh2CAbEgTRAbWpaFmZPr3hhKnTHX1z/59eQusNXyXOA5y6Gk6X0PKBxmXRTewuOWiTj1z1vw/1Ixu9q1Eb+WghbRi0z4yLCIuLsXvvQu1N4Qee/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; spf=pass smtp.mailfrom=ellerman.id.au; dkim=pass (2048-bit key) header.d=ellerman.id.au header.i=@ellerman.id.au header.b=evSrnfea; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ellerman.id.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1718712314;
	bh=gOhiVfNfmairOOUaxbmSwF8vcjb3mqukzSXclyx1uKQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=evSrnfea13LJ4+K+8TZsCpcjv59xzW0Eyjj+wdFhczBUqthYv9L19KxTDD3K3c7u2
	 2URnfh9eyWpfvikLFrCIgCZHsKlkefjb2ixZLqU9mVyECt3qzChxNqx10Nncy8ZKKd
	 RSt1hMJlmHHV1F/WAwUjNPxdnVwy+t8hs8Eg9WirRWO8dXr0NhHaRZplA9b6U+GTeU
	 6HR5Vb+IDbeO5dQ52kfsAMnRO/ORprCry3WW+qC8BgRdePM7WnoH6cpX9dcYqXCrCu
	 0JBemRMXnAU7jY9zCzmUs5fY9VLPc52kGSAa7I94lSjLaFBrStuwMu8cBHgzaalsgD
	 iz9H2xVQ6ZRZA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W3QRs0Chqz4wb2;
	Tue, 18 Jun 2024 22:05:12 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Linus Torvalds
 <torvalds@linux-foundation.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai
 <tiwai@suse.de>, Jan Kara <jack@suse.cz>, Thorsten Leemhuis
 <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
In-Reply-To: <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
Date: Tue, 18 Jun 2024 22:05:10 +1000
Message-ID: <87frta1mo9.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:
>
...
>
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
   
This is the better option. The fact that it's the patch link is right there
at the start of the line "patch.msgid.link", and will always be in the
same place visually, which helps human readers trying to recognise it
amongst other links.

>   - Link: https://lore.kernel.org/message@id-here # patch

Here you have to read all the way to the end of the line to see that
it's the patch. And it is worse with longer message ids, eg:

  - Link: https://lore.kernel.org/message@20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch

The "# patch" is almost off the edge of the screen.

It's also a bit easier to grep for.

> This would satisfy both the need for automation to have a reliable way to find
> the origin of the commit, and clearly indicate the nature of the link for
> humans doing commit spelunking.

+100

cheers

