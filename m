Return-Path: <ksummit+bounces-11-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 61921367369
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:26:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 16F5C1C1638
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA362FA0;
	Wed, 21 Apr 2021 19:26:07 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C52F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:26:05 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id p12so30879664pgj.10
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=WNuEabAUxyjC2TgqN2LIh/bq7L7YZbIRf4yMsHK2Xfs=;
        b=Ciy+0yjIemmONlLpR/4Proz20trzw0q2PeB2u45Q+2Pbh8itYMwULTDdeTAbdzcUg4
         LMLNsxnL5RbO4/iIzLDQCpDsL0+HiWQZmq2lTpn+lJDKOjtr9/gMeySfvwGoztbBuxQm
         oDFCmeN91eOqS9bQoUFPm1nq/jl9td/tiXpu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WNuEabAUxyjC2TgqN2LIh/bq7L7YZbIRf4yMsHK2Xfs=;
        b=r5n7Cy4MVzNvujtW2HbreYJsBs76DtWnO7KdJa6daZaSBentSFRD9FLIh+yd5+gjxR
         apWJeFdsdxav8+CSl98AdSEhY2yOC3dLvOTvAXo7hexj69q3LF1lNsVTe+LjP9u+oSvB
         y/KnUxnnqDTMLQ1DdSjREIiN4jbzQIlVcDh9Aw3fQhlIouEasMfOZanlJ7Q64TbddjFO
         y212K0ooY6CMn9GpyorPKswm3H4RRL594UQ4tdxZl1FGTREFMAeUxSDYz3BFXdvwhqct
         FtphwNvZvB0A3heOXpU0sFFg+NRaibNFL0fO5TlSKlVobxzLovlqXcHIDdiK9ODrEgQW
         xNLg==
X-Gm-Message-State: AOAM530spDI19o+n+nk8NSQYVS4Umm9LQXCAkL+nJFEuKrA3Eittwfb1
	LaZqOzMJ27WomMMqiKxlc/YTR3UDaQWSDQ==
X-Google-Smtp-Source: ABdhPJzOSzkOlYPGpqhU/nEyqMiIghWm58DmS5gyQPL9+fYnPIz0bB3PzKV04zgbXXMnP1xNc4SLkg==
X-Received: by 2002:a63:d017:: with SMTP id z23mr13581213pgf.228.1619033165390;
        Wed, 21 Apr 2021 12:26:05 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n48sm97963pfv.130.2021.04.21.12.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 12:26:04 -0700 (PDT)
Date: Wed, 21 Apr 2021 12:26:03 -0700
From: Kees Cook <keescook@chromium.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	ksummit@lists.linux.dev
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
Message-ID: <202104211223.DEB3B1FFF@keescook>
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210421152209.68075314@gandalf.local.home>

On Wed, Apr 21, 2021 at 03:22:09PM -0400, Steven Rostedt wrote:
> On Wed, 21 Apr 2021 11:35:36 -0700
> James Bottomley <James.Bottomley@HansenPartnership.com> wrote:
> 
> > I've long been on record as not really being a fan of trivial patches
> > because they can cause merge issues with current patches and introduce
> > bugs, particularly in older drivers, that don't get detected for a long
> > while.  However, the recent events with the University of Minnesota:
> > 
> > https://lore.kernel.org/lkml/20210421130105.1226686-1-gregkh@linuxfoundation.org/
> > 
> > Have elevated the risk factor around trivial patches claiming to fix
> > bugs to the point where it looks like there's no such thing as a truly
> > trivial patch and they all need reviewing.
> > 
> > Our policy in SCSI for a long time has been no trivial patches accepted
> > to maintained drivers, and I think that would be a good start if
> > adopted kernel wide, but I think the next policy should be no trivial
> > bug fix without a pointer to the actual bug report or report from a
> > trusted static checker.  This would likely mean we have to create a
> > list of trusted static checkers ... obviously 0day and coverity but
> > what else?
> 
> I take a lot of trivial fixes. I found two that I accepted that were from
> umn.edu, and both of them (after a second review) were legitimate fixes.
> One was in Greg's revert patch series, which I asked him to not revert, and
> the other was me looking at all patches I've received with a Cc to umn.edu
> emails, and was from a gmail account (which I'm assuming was someone that
> was part of this group).
> 
> I have no problem with taking a trivial patch if they are really fixing a
> bug. I think what needs to be done here is look at the patches that got in
> that were buggy, and see why they got in.
> 
> Perhaps the answer is to scrutinize trivial patches more. To me, the only
> "trivial" patch is a comment fix, or update to documentation. And even
> then, I spend time reviewing it.
>
> If you don't have time to review a patch, then by all means, don't accept
> it. Perhaps the answer is simply have a higher bar on what you do accept.

Agreed. I and many other folks do trivial patching all over the kernel
(though, yes, we're usually much better at describing tools, methods,
reachability, and impact), but I don't want us to swing too far in the
other direction and allow the UMN situation to have a chilling effect on
legitimate (even if "trivial") improvements.

-- 
Kees Cook

