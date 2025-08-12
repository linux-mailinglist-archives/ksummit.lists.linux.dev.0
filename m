Return-Path: <ksummit+bounces-2148-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BBB22ED8
	for <lists@lfdr.de>; Tue, 12 Aug 2025 19:18:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 67EEE189D847
	for <lists@lfdr.de>; Tue, 12 Aug 2025 17:19:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21332FD1AA;
	Tue, 12 Aug 2025 17:18:43 +0000 (UTC)
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5602F83CE
	for <ksummit@lists.linux.dev>; Tue, 12 Aug 2025 17:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755019123; cv=none; b=p/j98LcQAe/3zDyKNB6hI/M6wqUk0bb/L782d/Du2wj0fVcux/6+rX0D+yhOFNNY+Nyf4/SzZ2iPAlUNGZMn9V+I68ZeIOWq4nrIH0IO8stsw7z4ToDNfxOIjy7gfIshCD/ksB33yvkztWvNAnlCg5mqRGsnWM9jlEtyQxvOWNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755019123; c=relaxed/simple;
	bh=WmRQf4ynQKtFY7A+i+GPngG7qkxYqr8adszBGGB4Sy4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZ6UfBPj7aOrDuSDUSiWumTQxmMpNf4L34LLi6CGnebRyl3RXuq88Fk996CYsPbfQ7oUajzT5LfFzoMvPNHTQ2R+OlsV2R+EU0XsMhOMTIrH6MHpTqV9Yb4zVPFbqr59NDTY/rHbKe5XFGYuW+u0ltlh3GOBoQjc3zbrln8Z3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf10.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 35B3D1D3B46;
	Tue, 12 Aug 2025 17:18:40 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf10.hostedemail.com (Postfix) with ESMTPA id 654DD30;
	Tue, 12 Aug 2025 17:18:38 +0000 (UTC)
Date: Tue, 12 Aug 2025 13:19:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jiri Kosina <jikos@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 ksummit@lists.linux.dev
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
Message-ID: <20250812131923.69d34403@gandalf.local.home>
In-Reply-To: <87ectprmmg.wl-tiwai@suse.de>
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
	<cb91ddf05b9ea48056765a9027ff9132e080df30.camel@HansenPartnership.com>
	<2025080515-grandpa-prankster-ee83@gregkh>
	<p1886464-9p9n-4p0r-52r7-70sqprsoo32q@xreary.bet>
	<87ectprmmg.wl-tiwai@suse.de>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: e1yjybawwj9wze3tt1p5qurj5ahahop7
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 654DD30
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/0IrVgQUSv6GkPMyYsG8hBoV1CrV/XINs=
X-HE-Tag: 1755019118-747936
X-HE-Meta: U2FsdGVkX1/oI9BeI0lpZk0b+ZySYelphaQ62YondotZAgd3utwNlEhLJeylcltVpdVF0AEbjecPAOanHYmiC2VOHfIQW5vyQqYs/1VO4TgZjya8TxUZ/QIJaoNjvyqv6ZmJ08xbYf0pqznfrtXJoKCMcyELIL5HjBkwH+O9ZC2kA54LSN72fRCqoI8Jiq0bIpSungeXkNNc+Vy8PBLxS2yaAcnkmjkxcFu59fIqQZNzvxJuNN4UXsq8rwn4ZR6UfzvkYOI3T9k1q+4SNLlzpNmlXZ/FPGl/uEhZC6i61sBedaIG9QSU2ZVWM6mZYsjfxi7tNvy62joUwRx2An1sCbNF62lIZw5p

On Wed, 06 Aug 2025 08:27:03 +0200
Takashi Iwai <tiwai@suse.de> wrote:

> > For context searches if some particular information regarding stable 
> > patch history is needed, we can still do lore/lei queries nicely and 
> > easily.
> > Is there any other usecase (that people are actually actively using) for 
> > it?  
> 
> In rare cases, patches are incorrectly applied.  That can't be
> verified without the actual patch.
> 
> Usually it happens with a cherry-pick with fuzz, so we might be able
> to catch suspected ones, but the inspection of the patch is still
> needed.

As you state this is rare. Who actually checks this? I don't. I pretty much
ignore any patch that I marked as stable and it was accepted into the
stable tree. If there was a merge mistake, I would never see it.

If people are checking for these, then I suggest they use some sort of
digest and look. But I really could do without the email that it was
applied cleanly.

-- Steve

