Return-Path: <ksummit+bounces-370-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D50583C267B
	for <lists@lfdr.de>; Fri,  9 Jul 2021 17:00:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id E0F821C0F23
	for <lists@lfdr.de>; Fri,  9 Jul 2021 15:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314402F80;
	Fri,  9 Jul 2021 14:59:59 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A542168
	for <ksummit@lists.linux.dev>; Fri,  9 Jul 2021 14:59:58 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id i11so739915qvv.12
        for <ksummit@lists.linux.dev>; Fri, 09 Jul 2021 07:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=UPxJ3gYPn6Q/BkBy1PpY1LALUkWpF3gkP0nnoV3uPGQ=;
        b=sQ/zcNfhLOGPWOi3TiY5yEMU5K/qwA7H6E+H/lCUkctIbiDGlpudmV63Xs2PkSsIIf
         UMZxkFGXMJjV7J/jM0OmkyKVdU0fbZoz5i1QUQxJu0ecy71XyhERWgcV55DJVDbCn649
         Z1Ze7y6TcIClrNrycyBL4SlDOSSQws4/9hswzxTwgK3ezHJ5CKlrSNJnpEHJbYOtuPzq
         +BcHA1oBsXebq747aq4K2QBIAA/tE71JFVKjaAV51dD5LSS4Te6xi6QeE9pDhm9ZjOeq
         dTLw/VxCoT+GmkSElTvvwYTKcnSUHpAZyXs9AGu2YIyU/0oJ/3j8AVeK278BYwBjr/nX
         paXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=UPxJ3gYPn6Q/BkBy1PpY1LALUkWpF3gkP0nnoV3uPGQ=;
        b=UMZdUdI5g+vNUGCtiS08Y/tbvl4a9+fD6OiEaclNWGHjzpHJRrUXuKyV6pBxBqWuls
         AO9iiLwKOy3UbVanlyUhAkVwNyI2BvH2HmT68cCc1vMK6hfi28GaQI4uOVCPNwleYfpz
         vXbaLJOm+ELstHzVLKmmVjSLEyiIlbzt70nWHpo0eX4nZcF/TqPUirxTtI/HlrI0n18e
         2+UewmTSEUJq+RLLv7V5+Z0fdDTURisk2SKuxbFI64TClYYh+mstlFGvn+DwhuzrijWf
         PEa9ufR2PwS1zMz3r0OkG7Njoqj32ftCzjHsUS1VbydV/PQaYqDn0vFdD1EDHRJ2v4p/
         mIHg==
X-Gm-Message-State: AOAM532L6M6xAxv81YBpVNcRMhZwulV7aJ4aB7S5thDCmlKvBpcyOUTR
	h264wke5GXZlqFOp9dJ5sxY=
X-Google-Smtp-Source: ABdhPJyX/Un68bKHWzwTyzU6rTsHzpzbGPSq410/qcZfd+mZ3ZqbPXCLb9IbA6KxuEndO7ZuGXI1GA==
X-Received: by 2002:a0c:f7ca:: with SMTP id f10mr12099461qvo.1.1625842796251;
        Fri, 09 Jul 2021 07:59:56 -0700 (PDT)
Received: from [192.168.86.57] ([130.44.160.152])
        by smtp.gmail.com with ESMTPSA id g19sm2355477qtg.36.2021.07.09.07.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 07:59:55 -0700 (PDT)
Message-ID: <22d1051d4aa1e3db742349ab213485fe3429feec.camel@gmail.com>
Subject: Re: [Tech Topic] Integrating GitLab into the Red Hat kernel workflow
From: ketuzsezr@gmail.com
To: Don Zickus <dzickus@redhat.com>, ksummit@lists.linux.dev
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Date: Fri, 09 Jul 2021 10:59:55 -0400
In-Reply-To: <20210707211951.fyiflsp75i7spcha@redhat.com>
References: <20210707211951.fyiflsp75i7spcha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2021-07-07 at 17:19 -0400, Don Zickus wrote:
> Submission #89:
> 
> The Red Hat kernel team recently converted their RHEL workflow from
> PatchWork to GitLab. This talk will discuss what the new workflow
> looks like
> with integrated CI and reduced emails. New tooling had to be created
> to
> assist the developer and reviewer. Webhooks were utilized to autoamte
> as
> much of the process as possible making it easy for a maintainer to
> track
> progress of each submitted change. Finally using CKI, every submitted
> change
> has to pass CI checks before it can be merged.
> 
> We faced many challenges especially around reviewing changes.
> Resolving
> those led to a reduction of email usage and an increase in cli tools.
> Demos
> of those tools will be included.
> 
> Attendees will leave with an understanding how to convert or
> supplement
> their workflow with GitLab.
> 

Hey Don!

This sounds quite interesting to not just folks who are invited to the
kernel summit but also those who work on distro kernels day-to-day.

Would it perhaps be worth doing this on also on a venue that is more
open to distro kernel engineers (who aren't neccesarily invited to the
kernel summit)?


Thanks!

> 



