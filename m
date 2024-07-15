Return-Path: <ksummit+bounces-1433-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A705E931C37
	for <lists@lfdr.de>; Mon, 15 Jul 2024 22:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 506DF1F22E13
	for <lists@lfdr.de>; Mon, 15 Jul 2024 20:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4653A13BAE9;
	Mon, 15 Jul 2024 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PD03v/T/"
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C651369B1
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 20:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721076439; cv=none; b=j0huIy3XjA1tu5wJSmQj6hZ95Zcdeqxfnsu+p48qXf4Puc/JoiFFfb2/1cUnBLIqPoI/Bc/Q7nfkMcfS5DoPBzy/A38cs7cm3BvGcT8xRsK3fLsVUswK1osE55CsXt4k0GNVJ+6b5UuN27yGbcOUyN3pjgTpi9TVNx0mTb35KVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721076439; c=relaxed/simple;
	bh=c4MPNDdpLYaZa9Hn+JriemCmIAIMF+eX5rlaDJ/Htn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WANePTBw0e1jiwRtGyB3SpIVqLys/B3eO4kS2tYL1A32kDbfIEsYeT94wHEYDZtIHd7wDAL+MBkB3ibuWfZ9lI2WlsgS820swnrbUkbscpuUZaUPYnHZvEg44vYqtp6z1lzhJ3ju+UiyJ/WYvlb5CgJcI81WGrXBxnFCNn137Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PD03v/T/; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-75e7e110e89so2736240a12.3
        for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 13:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721076437; x=1721681237; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1L6QS7UnA9mhEjmsRvV02NmmiCtD4P/miK4rnoHRBnY=;
        b=PD03v/T/gqgM1xi5K9b0TITc4fSa2gzW8+vZcebDd39Hn8PazWpIH2pdplBNnTJOGE
         7Gdb9PqM+lVwbA8vsNgxZOjlTyt9+FOOE8McfIlyKXEAAV4zmsE2Rn9orSlF5UZZA5+5
         w91iNi26N6sv8+1FtIxULIvgWETu+tQZrGW8MTqTsbJBvKNiFCukmR8jSZwUn9U4DkaX
         v7eHxux+zwkN3Zl8WZmaPpDvA1JsMnOWwzYdhVsyEflutmw0Wk4tmKMAxfzcM6zZypBu
         B5f5hlV2KxEdVhhJVOdrO3ThxNKwjDL9/yTwep/7maXa7/f6GTxuPul/Snjln8VnEB1O
         MdPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721076437; x=1721681237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1L6QS7UnA9mhEjmsRvV02NmmiCtD4P/miK4rnoHRBnY=;
        b=f0rGLCU1tERiFHUyH/xguHEuCOfmB9rfziIAIzyO5tFsW/mVecubP1TZYKe6RDCCEY
         2IWuCvt/h+RvYRFT93Kj7GJanMlbP4yVDaMFqR3nhE5USe55LGkIuTzYjMVNxh0jP4um
         Y8egGIudLY6Mxs+IPuVZ3pG9UZtlwoDMrjZbhWnCQDMjuWHLNZGXpRdGN9rBZCxqSmDV
         pLnwYIBSlS0MPKsk96XpKvJf5rHSelNLv5Q85LEgL2Ioz8lNDAqftYYZAu1I57QWkf4p
         yHydYbLyUV7EoyAFAtKZjGAZpW6aJKfmGUANygyqk03XssctYi1bgqHxqNFmYYECuP+3
         cYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN145uVstKiwUVTyFnmpgE3mgUqSFWO2zkliC8CT1zHgbol2Tr7YIhIeiGaIxtxZ7nC6Zr6ktj8BVfg6+BeJPnDMnOGGA0Og==
X-Gm-Message-State: AOJu0YykHWH5CAFUkQN9FwzjFWDuO1mQbQKje6dmPx1isSWZh2Vqt/cp
	XqGuu6oFRuLb3cNCiyfBqJgar8oMEqLa4fZdSQdrg0H61b/zPpSB
X-Google-Smtp-Source: AGHT+IEtALjFcu8NPU7r/X1zwG5xU4OkVth++WKATsiIEHklsgotGiYxkf9WiNojrYHMGEN5P249dg==
X-Received: by 2002:a05:6a20:72a2:b0:1c2:8d16:c684 with SMTP id adf61e73a8af0-1c3f122f8e8mr118777637.21.1721076437378;
        Mon, 15 Jul 2024 13:47:17 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6d45:d4db:b14d:ea69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc50a4asm45029675ad.283.2024.07.15.13.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:47:17 -0700 (PDT)
Date: Mon, 15 Jul 2024 13:47:14 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Theodore Ts'o <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <ZpWK0m7Ps6Y4vjL2@google.com>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
 <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>

On Mon, Jul 15, 2024 at 02:06:55PM -0500, Dan Carpenter wrote:
> On Mon, Jul 15, 2024 at 02:00:00PM -0400, Theodore Ts'o wrote:
> > On Sun, Jul 14, 2024 at 04:18:00PM -0400, Sasha Levin wrote:
> > > From my experience, most issues tracked by regzbot and fixed upstream
> > > don't actually have a stable tag. Here's one I just looked at a few days
> > > ago: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f451fd97dd2b78f286379203a47d9d295c467255
> > > 
> > > And I'm actually happy to point to that one as an example because the
> > > ext4 folks are usually great about stable tags.
> > >
> > > Should we have not taken that commit?
> > 
> > Yep, that's just a mistake on our (my) part; you should have taken
> > that commit, and my thanks for taking it without asking us.
> > 
> > That being said, maybe one path forward is that the stable team
> > *should* be asking the subsystem maintainers about.  "Hey, the
> > following commits appear to be backported, but you didn't add a cc:
> > stable.  We plan to backport them unless you complain."  This has the
> > benefit of giving feedback to the subsystem maintainers that they they
> > missed tagging some number of commits, which might remind them to do
> > better, or make them decide that they want to do something more
> > explicit, such as have their own stable backports initiative ala XFS.
> > 
> > More generally, it seems to me that we are conflating multiple issues
> > here in this discussion which may be making it harder for us make
> > progress on the question.
> > 
> > 1) There are some subsystems who don't care about tagging commits,
> >    either Fixes: or Cc: stable, or both;
> > 
> > 2) There are subsystems which are trying to appropriately tag commits, but:
> >    a) Sometimes they will make a mistake, and forget to cc: stable
> >    b) Sometimes it's too hard (tm) to figure out what is the commit which
> >       introduces the regression, so they either make up something (e.g.,
> >       hmm, it looks like commit XYZ changes one of the line that is touched
> >       by the patch, so <shrug emoji>), or they will add a Cc: stable but
> >       not supply a Fixes: tag
> 
> Too hard doesn't work as an excuse because someone has to figure it out,
> and it may as well be the subsystem expert.
> 
> I've already added a checkpatch warning when people CC stable but don't
> include a Fixes tag.  I also plan to start going back to maintainers
> and manually asking them for Fixes tags.  This will be attached to the
> patch.msgid.link URL so the stable tooling can pick up Fixes tags which
> are added later.
> 
> The one question I have is for patches which pre-date git.  I was told
> to leave the Fixes tag off in that case, but I think that's out of date.
> It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".

If a thing was there since before git and only now is being discovered
it either needs to be explicitly marked for stable with cc: or we can
just keep the fix in newer kernels. IMO this particular "Fixes" tag does
not bring any value.

Thanks.

-- 
Dmitry

