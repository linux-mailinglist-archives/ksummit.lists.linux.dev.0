Return-Path: <ksummit+bounces-1297-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A50909D24
	for <lists@lfdr.de>; Sun, 16 Jun 2024 13:32:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CC96DB20C9E
	for <lists@lfdr.de>; Sun, 16 Jun 2024 11:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06FED16C6AF;
	Sun, 16 Jun 2024 11:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="la+VPS8O"
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8314C502B9
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 11:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718537530; cv=none; b=Regords6tgSKzu0GSr5gN1+l+ccf49q6KqQ3Y19Qjno2y8wawP6d5zoYespKEIkjIuI1WFRsgKyyfLc3zY4FYsxZvG12y/FtQgeNg5zFLn8fgno3aAn2vR/Afw3JmpIcN4m5SiboyPO3ZRZAjpSQWaAYPv9pNb0JNJ612drwI5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718537530; c=relaxed/simple;
	bh=SzmV3y4y7Ej1uO77goUmxU1pDEhQzmTApmZvQmVZtgA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cc/RHr6eEvWWqapjcO2Yj7yo1GnCsXjBUnnXbQUCvjua+3Azkei0C5cnfyFURTiFnEwjIewk5iNfwBk/ZxZJPkCcHKuDiVvjuAk8bQrvqBa5k7A3hFUpoFD9GCLhF/fCyKDnddyJFyc3Vp4Uc/477a0i+wvpUOWbIv8o3+qwa/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=la+VPS8O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F60C581;
	Sun, 16 Jun 2024 13:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718537504;
	bh=SzmV3y4y7Ej1uO77goUmxU1pDEhQzmTApmZvQmVZtgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=la+VPS8OgG7jh06cxhaZ+OaS9Fy5FPplIbGn6PF258PwV8Wbet+ixsbRRqpVzUfLd
	 BF5HpjshyikNqk+ZFpjc5DVkaN1+9cld/6rFeoq2GoVoZpIEJpiVaESKgktkrFMBZb
	 DEeeHn7D/bah7Da63iICi11La+zFdehAvvBKIhbY=
Date: Sun, 16 Jun 2024 14:31:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>, Takashi Iwai <tiwai@suse.de>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>,
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
Message-ID: <20240616113139.GA747@pendragon.ideasonboard.com>
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info>
 <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat>
 <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com>
 <70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <70bce57a-22b5-482c-89fe-d9cd775294f3@redhat.com>

On Sun, Jun 16, 2024 at 10:10:25AM +0200, Paolo Bonzini wrote:
> On 6/16/24 03:13, Linus Torvalds wrote:
> > And no, I'm not at all happy with the fact that apparently vhost and
> > kvm has made it their thing.
> > 
> > Paolo, Michael, Takashi, please put useful links, not those braindead
> > message id's in your commit messages.
> 
> Ok, ok.  Before lore existed, there was no service that I can remember 
> that archived messages with a message-id in the URL.  So, for example 
> Gmane links would be useless now, and patchwork links are not really 
> something I'd trust for long-term archival either.
> 
> These days, it's mostly just that I have set am.message-id to true years 
> ago; but since lore is managed by kernel.org, we can expect the URLs to 
> be stable and the original reason to use Message-ID is obsolete.  Having 
> learnt right now about the applypatch-msg git hook, I've stuck a
> 
> sed -i -e 's,^Message-ID: <\(.*\)>$,Link: https://lore.kernel.org/r/\1,' 
> "$1"
> 
> in there which should do the trick.  I guess Michael and Takashi can do 
> the same. :)
> 
> 
> By the way, if you use Firefox, you can do the following two steps to 
> install a search plugin that searches lore by Message-ID:
> 
> - first go to 
> https://mycroftproject.com/install.html?id=121759&basename=lore_kernel_org&icontype=png&name=lore.kernel.org 
> to install the search engine (an XML file, you can see it at 
> https://mycroftproject.com/installos.php/121759/lore_kernel_org.xml).
> 
> - then go to about:preferences#search and add a search shortcut

You can also add a smart bookmark:

- Name: 'Lore' (or whatever you want as a name)
- URL: https://lore.kernel.org/r/%s
- Keyword: 'lore' (or whatever you want as a keyword)

Entering 'lore <msg-id>' in the URL bar will then do the right thing.

> On Chrome instead you can add https://lore.kernel.org/r/%s at 
> chrome://settings/searchEngines.
> 
> (Apart from git commit messages, I use it also with the 
> https://addons.thunderbird.net/en-us/thunderbird/addon/copy-message-id/ 
> extension for Thunderbird).

-- 
Regards,

Laurent Pinchart

