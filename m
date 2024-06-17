Return-Path: <ksummit+bounces-1310-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E30090B618
	for <lists@lfdr.de>; Mon, 17 Jun 2024 18:18:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45F4283E95
	for <lists@lfdr.de>; Mon, 17 Jun 2024 16:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD3D18E28;
	Mon, 17 Jun 2024 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lytEVof6"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C478318040
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 16:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718641113; cv=none; b=VjnIQ9I+1Jj18x36Zs1MNwJE73vl4G7Eigrhse8Qi+sbuRh37W97oXGzp9f2XEiDTnwwFsKHxNH0vrfR/+FuONWwuRGEzYCuG5OPVaES9X6NaunuT+V3A/0pNJzY5TF15xQ+3RevE5lryY1mBgpfBurVDdwYJucGtgwnWt9X3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718641113; c=relaxed/simple;
	bh=RJVDjqT1RQFMfa6VVtPtL3ZYX0oyWqQTMETc3saTDTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaILkHffZQ0YSJ03Oykp3owyVnA3ZcH6guuUIgAkj9V/ieXunjfQfgTVtZUtBx1oUIyFfYYFS0pE6b+etZzrHuYePLucUH5+w711Fmy0azt2po4Nv5GRpcOMrlB9DGKVhj6r25WSs04IZuuuSXcx91scP1CnOY6dECFPtwtSz64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lytEVof6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43561C2BD10;
	Mon, 17 Jun 2024 16:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1718641113;
	bh=RJVDjqT1RQFMfa6VVtPtL3ZYX0oyWqQTMETc3saTDTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lytEVof6HfctQErQk+gBgXygOJY8eMWHdqymXoYUJAfaWxaKm+tZTwQJE5/W6OltJ
	 Lqo+ikxXCB4NLb1yJ+zydoSk1DkVOMRCRPgm0jtQedGptylzLcKuWFXud10/OUOp5L
	 RhOHpAHMJJ7JfUsJzkgzUT0XvDu8QtYZAazhdSTQ=
Date: Mon, 17 Jun 2024 12:18:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Takashi Iwai <tiwai@suse.de>, Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240617-crazy-cougar-of-romance-becc3e@meerkat>
References: <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <20240615232831.6c7f27dd@gandalf.local.home>
 <CAHk-=wiUS4r788i5XjTtSwvfvKRm9uH2H5=eLHbZVu3Wo-YHCA@mail.gmail.com>
 <20240617-arboreal-industrious-hedgehog-5b84ae@meerkat>
 <1ff23e26-0099-4826-bb79-4928507edce1@paulmck-laptop>
 <20240617-inventive-bumblebee-of-champagne-e133bc@meerkat>
 <79b5f7fb-28b1-441f-a064-eb52be0d20da@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <79b5f7fb-28b1-441f-a064-eb52be0d20da@redhat.com>

On Mon, Jun 17, 2024 at 06:14:48PM GMT, Paolo Bonzini wrote:
> > - Link: https://patch.msgid.link/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat
> > - Link: https://lore.kernel.org/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat # patch
> 
> Two questions:
> 
> 1) just one is needed, right? (should go without saying, but still)

Yes, either-or. I just need to know which link takes me to the original patch.

> 2) Is the "/r/MESSAGE-ID" format (https://lore.kernel.org/r/20240617-arboreal-industrious-hedgehog-5b84ae@meerkat)
> not valid or deprecated?

It's valid, but /r/ has been unnecessary for ages.

> And of course, to Linus's point from yesterday, this would only apply to
> patches that _did_ come from a mailing list that is indexed by lore.

Of course.

-K

