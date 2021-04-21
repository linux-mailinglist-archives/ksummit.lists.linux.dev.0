Return-Path: <ksummit+bounces-12-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 58464367379
	for <lists@lfdr.de>; Wed, 21 Apr 2021 21:33:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 7CE641C1739
	for <lists@lfdr.de>; Wed, 21 Apr 2021 19:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4BF82FA0;
	Wed, 21 Apr 2021 19:32:51 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9B2F83
	for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 19:32:50 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 65-20020a9d03470000b02902808b4aec6dso35200621otv.6
        for <ksummit@lists.linux.dev>; Wed, 21 Apr 2021 12:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nhrYPzDxGv+/l28bIA6ykeVIy3Qr57I7WmvzN3AUg7A=;
        b=qqwpbK1/s8UNHcJNqCOpU8OHqDyLVDl/OnyLJI4L6UTrC4e/eoIdoCHCxnLp+jd3Y0
         GfuI2QEb/2qzkB4xR3YRSTCby7S8+A0jmX4P9Fad2mZCMwyLiXaHcbV42nFqIvLHceil
         84OFfFVWP2wI/adg4/cn3JAeVlr/EjBGmsJ7iTFBeJwzqCEkjtbBHxHgMvYPFvORf/Jm
         rY8Kx8NaZHL0lbOAtbWhzqd+slQmVuUPspSrYlZar4w1uHYZHzpFq39iJ+rXndaj7XJ2
         uSw+D2nlSpurHPez6jV4/Ue0FHwcGOU9KIsom00OmESgVAotB28wCklLLAAlBpdZU6np
         Thyw==
X-Gm-Message-State: AOAM533jICj8Kq+Jr/a9jvXcxD6Ikl56MBTsOpCGoIT9DykYA4m+cuUr
	NbaCmUnfl35OwvIuuisFVa83OekemBFZQbmm9BU16AfY
X-Google-Smtp-Source: ABdhPJyt1ZouyFSKZVraTWd9pYpHvSEj5BxevRt43yDPX7zUxsD3DbqqBWd7S4Jc1e/wH9R6udctnHezCYYSZzTUW2k=
X-Received: by 2002:a9d:bc3:: with SMTP id 61mr23253850oth.7.1619033569703;
 Wed, 21 Apr 2021 12:32:49 -0700 (PDT)
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <afc5664dc2b60f912dd97abfa818b3f7c4237b92.camel@HansenPartnership.com>
 <20210421152209.68075314@gandalf.local.home>
In-Reply-To: <20210421152209.68075314@gandalf.local.home>
From: Roland Dreier <roland@kernel.org>
Date: Wed, 21 Apr 2021 12:32:33 -0700
Message-ID: <CAG4TOxNOHRexUoKTo7ndViNtss0_BDeh4YCVHexvdQhQWF+vaw@mail.gmail.com>
Subject: Re: [MAINTAINER SUMMIT] Rethinking the acceptance policy for
 "trivial" patches
To: Steven Rostedt <rostedt@goodmis.org>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 21, 2021 at 12:22 PM Steven Rostedt <rostedt@goodmis.org> wrote:
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
>
> There are a few people that I will accept patches from with out review. But
> anyone else, I scrutinize the code before taking it in.

I agree with this.  And indeed to me perhaps what needs to be
calibrated is our definition of a trivial patch.

If someone sends a patch that changes "speling" to "spelling" in a
comment, then I think that's fine to apply without much scrutiny.  If
someone sends a patch that changes reference counting on an error
path, then that absolutely needs to be looked at to ensure
correctness.  There are enough people sending wrong patches without
even thinking about malicious actors.

I also think there does need to be a strong sanction against this UMN
research group, since we need to make sure there are strong incentives
against wasting everyone's time with stunts like this.  Hopefully on
the academic side it can be made clear that this is not ethical
research - for example, why did IEEE think this was an acceptable
paper?

 - R.

