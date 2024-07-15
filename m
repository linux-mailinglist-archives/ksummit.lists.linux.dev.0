Return-Path: <ksummit+bounces-1410-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3EF930F49
	for <lists@lfdr.de>; Mon, 15 Jul 2024 10:03:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 464D81F21196
	for <lists@lfdr.de>; Mon, 15 Jul 2024 08:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E9218509F;
	Mon, 15 Jul 2024 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="u+g8dKBR"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A4518509C
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 08:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721030577; cv=none; b=Fah7Xbw04ynBSCO+GC9Ths/nJLdxQETRe3yXHIi8WYW9VrXWgVO63ArXocFuRL6rQzw+cenq5PICz31sHmWk+3u7rX6qAfWkIdICBxLNrl7HSHhxsiV60rBcwCRkxK7TuQVvAljUugSsjbDsl+zL9BlmMQcTgH754Cl1r7K740Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721030577; c=relaxed/simple;
	bh=9n92b+g402+qrsZlAWKBraEXuTamvocmtRDrQ0JQVjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UX2HfeKz2O8snOAB6SYcv7cnGtt578/ubVdu/arsGFeDHSK6/ZngWPWfJAJJQSvVTDnuXmkdoR4oVDe4owxZQSSSfx/NDG1jz6v9oHuH4dH1hbo0igHvvFa2AlfYB3GAMcKwi1u4dAeA5/OlqgiQYcIdQUBK+te8mbJMN6o+Ax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=u+g8dKBR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC5F8C4AF0A;
	Mon, 15 Jul 2024 08:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721030577;
	bh=9n92b+g402+qrsZlAWKBraEXuTamvocmtRDrQ0JQVjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+g8dKBRsgmOoaP43r54mgYOT1zudiSDqlx9IqUPiZj6bkh0DofBT+DD9dUwITHZk
	 IqV/lmjswaf1YjZzS8PspXkNwLzo6HKPkme1hiN6Nr9PTwBgW9rhVt4oizbaTwtmtq
	 OIU3WTA0Uar1vaoYPDe6alrt8oHWyPuwlaNvBBlU=
Date: Mon, 15 Jul 2024 10:02:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Sasha Levin <sashal@kernel.org>, ksummit@lists.linux.dev
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <2024071528-cahoots-reacquire-9eab@gregkh>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <CAHk-=wgyLHxdj0wJT-2y-OVVvPbZgg7XtCdcd6UHBmhTWLtoKw@mail.gmail.com>
 <ZpQdJpKhIzmf3veU@sashalap>
 <CAHk-=wjfXLDGBjieQhLRCP2tQnXTYhW2MiY3LWJ=g7QDE1cRyA@mail.gmail.com>
 <ZpQ0soWV6zIpgigf@sashalap>
 <0e6c7c8ed259dcb50631c6fdc3d86d3080bdc6f3.camel@HansenPartnership.com>
 <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wjLShGxeGtjRGkjQni+VzWC0yrf34EP0AUn+_zU0u-WeQ@mail.gmail.com>

On Sun, Jul 14, 2024 at 04:09:06PM -0700, Linus Torvalds wrote:
> On Sun, 14 Jul 2024 at 16:06, James Bottomley
> <James.Bottomley@hansenpartnership.com> wrote:
> >
> > But we know how to enforce a unified view of process: we document it in
> > Documentaion/process ...
> 
> Hahhahhahaahh.
> 
> Ahh, you're such a kidder, James.

Yeah, and that's the issue here, we have whole subsystems and many many
maintainers and developers that do not follow this at all, hence our
need to pull into stable commits that only have a "Fixes:" tag on it.

Now we can start running a bot on all submissions that says something
like the one that I have been doing for the USB subsystem for the past
few months, here's the text I use:

	- You have marked a patch with a "Fixes:" tag for a commit that is in an
	  older released kernel, yet you do not have a cc: stable line in the
	  signed-off-by area at all, which means that the patch will not be
	  applied to any older kernel releases.  To properly fix this, please
	  follow the documented rules in the
	  Documentation/process/stable-kernel-rules.rst file for how to resolve
	  this.

But I doubt everyone wants to see that polute their mailing lists :(

Anyway, if people want to stick to the current, documented, process,
great, but as-is, trying to get people to follow that is rough and not
really working.

thanks,

greg k-h

