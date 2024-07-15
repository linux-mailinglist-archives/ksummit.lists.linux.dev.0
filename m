Return-Path: <ksummit+bounces-1426-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E84E6931AA0
	for <lists@lfdr.de>; Mon, 15 Jul 2024 21:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E8CE282AA7
	for <lists@lfdr.de>; Mon, 15 Jul 2024 19:07:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0DD77102;
	Mon, 15 Jul 2024 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZxbUaaG"
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64973B7A8
	for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 19:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721070421; cv=none; b=tN7OUSiKk0ezkpF462p34YctyaeWUqJSes5sXIS4c9ev2nc3RIqgpr3LCj0LD0vrA0wkEXaIngm6xAkisZSAC/gbR3Lz8t4WrtgVb0IewM7zmf3GtXrRnrnTgpFZbpP/Dl/ikSCLsoyJqdmlQYB7raQ54lKE/RWpHNgfbu+SUFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721070421; c=relaxed/simple;
	bh=Iuo/wkS18j+bsOfRn615Y0gXlLKqov72W0FDgHJtn74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2sd9ncEWy0stOLGlaTQYHJmwX5jkWN85XNeHYjAiIQRgMNFFTZsJSMD1PyLj0qcP7TgVrjw9ew9fogpmTz69oSGP37whUPS4ehMZAn3FmCtcl0wCduy5LMV2IJ9PtBA6bAVApHBMS0H03sXW8rHHJiFtOFuniHN3LF4HW24k7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZxbUaaG; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5b97a9a9b4bso2149100eaf.0
        for <ksummit@lists.linux.dev>; Mon, 15 Jul 2024 12:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721070419; x=1721675219; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o4vdnYJZNkd6LQ8khV9Y1zAq0ZPd/PwzHIMN/8+uzIc=;
        b=dZxbUaaGIXe5DhmW27GN4g0uVKuiJ+cBqXMrxrIDDfnk8vJ5+FIkWvuuh3EpMqQzED
         4m/UK51FyAnJa+z4qbQWzaRB4/BhHxGzTBatEUIoWleahS4yeIT2IbJeqqxf0QczkiHL
         9H2vuCMDq2XfIB3LROy9KEz73FYh3BUNghbzTKRVlRjW3irdtVb9ueyrZEmgld2jsmUR
         M9QYhCvKhrvx6i4E1uIadg6jxdiu4XYU+mE2FzmoAtRoVp5n4waFGYBq/MvZUPRnaQhZ
         TcZV8BFFk8jYtFHlzmSuS7KdmIpatlxo+Ugzc+0oeEC0LbU5yMBmRwhVgLkFqxAkF7Vy
         FgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721070419; x=1721675219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4vdnYJZNkd6LQ8khV9Y1zAq0ZPd/PwzHIMN/8+uzIc=;
        b=cOUWN0ZbyUuliOmZ33QAhEv5hGqqt7Gut1hJ6vZIonYyG1rgc+1gL+hRhPNQLNXwbu
         QQHjFgUTwnOJevwPc+i5UQJhpc0gBZykPiJ1V3fOga0YiDb3zw9AP81x9QyuXlMJ72eT
         jaI1Y0Ah64WMv0qE9sS8Vpnx9ZPkZCoWBf1bgr1rN5AcwdxzQtXjdjvRCkXUHbXsbz+A
         iB0KNWGH26Uif3HirGzFTGQlShFBTNggGbN01FS4w4Sg3RobSfsN4qek+4oZ2V4tzgjs
         9ISPSMbH+atWkmEAczCC0VZWqm5FFC7BbGUVgsRn6JqI5iLqWL8NE3XfUivzIc9ov5tc
         0JoA==
X-Forwarded-Encrypted: i=1; AJvYcCX+9dFrV2jRR95igKV3X6c4JXXnyHbZ5osNbsCpEAiEesI7OrYZd3IYaJub9RwUMzUWbZU3W2oqUWFis2JEZMODW+S02tdZJQ==
X-Gm-Message-State: AOJu0Yw58QWvjlUNm0QXucevUydSGDuIYM8DZID1FZ3iqZPhSDUzO358
	F5JLxWjH+vx7uiXmw0Fqr+DPOhgcWuXyNjAFso5qZJtSthx2qNYcYkgyxN8tfeg=
X-Google-Smtp-Source: AGHT+IGSSdhLfYpm25YqE7EaW0ka3jut29TEe3w60JzB0bP5xLhwcGjjJZVyHfZvZrYWRhVrAvevHA==
X-Received: by 2002:a05:6870:328a:b0:254:8d79:d7b7 with SMTP id 586e51a60fabf-25eae822ee3mr18236639fac.26.1721070418770;
        Mon, 15 Jul 2024 12:06:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:358f:3413:c118:4021])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-260752a9036sm1070782fac.38.2024.07.15.12.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:06:57 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:06:55 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Sasha Levin <sashal@kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	ksummit@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Proposal: Enhancing Commit Tagging for Stable Kernel Branches
Message-ID: <fee1f575-e90b-495f-8832-6735c1917054@suswa.mountain>
References: <ZpPFJH2uDLzIhBoB@sashalap>
 <915ef4884d0cd347a1e0c87584346c764f7a11cf.camel@HansenPartnership.com>
 <ZpQbQa-_8GkoiPhE@sashalap>
 <f0d42bfb20b728b0c80daff864bd858ce86b3bfe.camel@HansenPartnership.com>
 <ZpQyeLFJY1gJvRRA@sashalap>
 <20240715180000.GC70013@mit.edu>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240715180000.GC70013@mit.edu>

On Mon, Jul 15, 2024 at 02:00:00PM -0400, Theodore Ts'o wrote:
> On Sun, Jul 14, 2024 at 04:18:00PM -0400, Sasha Levin wrote:
> > From my experience, most issues tracked by regzbot and fixed upstream
> > don't actually have a stable tag. Here's one I just looked at a few days
> > ago: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f451fd97dd2b78f286379203a47d9d295c467255
> > 
> > And I'm actually happy to point to that one as an example because the
> > ext4 folks are usually great about stable tags.
> >
> > Should we have not taken that commit?
> 
> Yep, that's just a mistake on our (my) part; you should have taken
> that commit, and my thanks for taking it without asking us.
> 
> That being said, maybe one path forward is that the stable team
> *should* be asking the subsystem maintainers about.  "Hey, the
> following commits appear to be backported, but you didn't add a cc:
> stable.  We plan to backport them unless you complain."  This has the
> benefit of giving feedback to the subsystem maintainers that they they
> missed tagging some number of commits, which might remind them to do
> better, or make them decide that they want to do something more
> explicit, such as have their own stable backports initiative ala XFS.
> 
> More generally, it seems to me that we are conflating multiple issues
> here in this discussion which may be making it harder for us make
> progress on the question.
> 
> 1) There are some subsystems who don't care about tagging commits,
>    either Fixes: or Cc: stable, or both;
> 
> 2) There are subsystems which are trying to appropriately tag commits, but:
>    a) Sometimes they will make a mistake, and forget to cc: stable
>    b) Sometimes it's too hard (tm) to figure out what is the commit which
>       introduces the regression, so they either make up something (e.g.,
>       hmm, it looks like commit XYZ changes one of the line that is touched
>       by the patch, so <shrug emoji>), or they will add a Cc: stable but
>       not supply a Fixes: tag

Too hard doesn't work as an excuse because someone has to figure it out,
and it may as well be the subsystem expert.

I've already added a checkpatch warning when people CC stable but don't
include a Fixes tag.  I also plan to start going back to maintainers
and manually asking them for Fixes tags.  This will be attached to the
patch.msgid.link URL so the stable tooling can pick up Fixes tags which
are added later.

The one question I have is for patches which pre-date git.  I was told
to leave the Fixes tag off in that case, but I think that's out of date.
It's more useful to say "Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")".

regards,
dan carpenter

