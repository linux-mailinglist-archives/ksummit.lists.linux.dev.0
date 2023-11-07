Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4757E465D
	for <lists@lfdr.de>; Tue,  7 Nov 2023 17:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 30D8BB20D83
	for <lists@lfdr.de>; Tue,  7 Nov 2023 16:51:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC1C328C0;
	Tue,  7 Nov 2023 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SO6EbnaL"
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F98931584;
	Tue,  7 Nov 2023 16:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A001EC433C7;
	Tue,  7 Nov 2023 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699375886;
	bh=EAK+qfRbtRhsy9UvpsNzFaTH9Mvr71+XSrobOACKGmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SO6EbnaLVuHsIHc+ZihFR88LyFz8CZF2VuEEFUXVzdqRWX9IsIw1npIDZgV73pyAz
	 RLMqo3ZfzcIEEy35f698jsaCMOmCXgaQI8/6lEcE6yVghPq0P/ASb5OFbesbp1ZuuZ
	 +fSa9jUW9Pbkd6h8PhPctvZ+By3lh0KTaoHDM6tw=
Date: Tue, 7 Nov 2023 11:51:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, 
	Pratyush Yadav <pratyush@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Pavel Machek <pavel@ucw.cz>, users@linux.kernel.org, ksummit@lists.linux.dev
Subject: Re: RFC: switching "THE REST" in MAINTAINERS away from
 linux-kernel@vger.kernel.org
Message-ID: <20231107-resolute-honest-pelican-8fe2a9@nitro>
References: <20231106-venomous-raccoon-of-wealth-acc57c@nitro>
 <ZUluOoDjp/awmXtF@duo.ucw.cz>
 <34eda1fe-0e14-4f12-b472-d152eadb7b88@redhat.com>
 <20231107101513.GB27932@pendragon.ideasonboard.com>
 <mafs0o7g5hiba.fsf_-_@kernel.org>
 <b36d7b18-2092-1848-e22a-7e34588db0f5@inria.fr>
 <20231107-skilled-calculating-frigatebird-8db1bb@nitro>
 <cefe4c99-2af9-4e22-a448-801a7080fc48@redhat.com>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cefe4c99-2af9-4e22-a448-801a7080fc48@redhat.com>

On Tue, Nov 07, 2023 at 05:43:20PM +0100, Paolo Bonzini wrote:
> > I assume you're asking if following links to lkml.kernel.org/r/<msgid>
> > is still going to find the thread? If that's the case, then yes, it's
> > really just a redirect to lore.kernel.org/all/, which aggregates
> > everything across all lists indexed by lore.kernel.org. You can
> > similarly search in /all/ for the subjects matching commits if you don't
> > have a Link:. In other words, this functionality is not affected by
> > which list the patches were sent to.
> 
> What about _pulling_ all patches from public-inbox?  Right now the git repos
> under https://lore.kernel.org/lkml/ do not catch everything, but it's close
> enough.  There would be no https://lore.kernel.org/all/1.git/ and, even if
> there were, there is no easy way to filter out non-Linux projects.

Sorry, I'm not entirely sure what you're asking. You want to be able to
automatically retrieve all patches but only if they are related to the kernel?

-K

