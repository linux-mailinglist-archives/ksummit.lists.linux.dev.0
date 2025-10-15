Return-Path: <ksummit+bounces-2540-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4300CBE0FB8
	for <lists@lfdr.de>; Thu, 16 Oct 2025 00:51:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1F5640263B
	for <lists@lfdr.de>; Wed, 15 Oct 2025 22:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7153731618D;
	Wed, 15 Oct 2025 22:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rf7Vlyuj"
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E63C314B8B
	for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 22:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760568701; cv=none; b=kCvlM/mRpF0X9V3GE2lS8/5Jd41xsYPWOilx8W3QfIaw9mNsvHpov1/EzLMdOhAwF2ZQRPEZKTe92Y4l7/U2oFDS/eTDpR3cKil6tfAp6EM939a4aHzXYL+dJy9ZSZbm2+Jq/ja1cPFm3a6aN4xIZn/Y+7cyoSWjughKU2gugrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760568701; c=relaxed/simple;
	bh=rIdBK+dpA4u1qLFdqOpLbAQkZFWZ750ofRc3ojtcYss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pr1FCpwdlE3+CvVxkMVzgGQyTG7luph06e7w6q43+jicD6AYv4GdSikBbmcBzT6g3d+iC06fIjcp7a1gIHm/Z/2YJOkwEWPGd1Kr84s7nO2zwCTmADjqu89UFg+piW0ve+mywGo98s6/in561nzZwzvVslKtDHD+7OdhOaD8g7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Rf7Vlyuj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3324523dfb2so138500a91.0
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 15:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760568699; x=1761173499; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMC4JwwWbLvJn0IeU/CARiQi6E5zzBcOZ3odLEwryGU=;
        b=Rf7VlyujcrQWnUd3hti2/nPlwlcCUbmHLqJ6auhL22HjWDGyJzrh1pPPeURBc0RD2E
         DyQ27MD4gMIQkgMfF6hAc8DrNEQTlTQ58zj+nyrSNj09jcZFlw41Mf5ESG4M0kssDKcH
         7ATBB8wfBge7eOLX8mb9o1NPvzzQTmXG0r1Do=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760568699; x=1761173499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMC4JwwWbLvJn0IeU/CARiQi6E5zzBcOZ3odLEwryGU=;
        b=vHS/t1glTwLA5vqqsaRnzTGMp4zH+tH/sXUZCGF81uo3KuwdCF+AXwlQ9yGOh+zoUQ
         BridZmlGYFpEaQjc/ZEZbQ5Qq8Ex35wtfHCTc6dF5TpbllPPR0pdLNdHIr994uBeDgUp
         p+DMziZD/1yCT+3/7VcBknO3HoKFGawWreTjRMJGuJMdkTRK8hZsYz41IrUzts6Q6aoo
         Ct/UMqGkLOhBDhWC1fneXDa9WLcY31KwsATjRx2ZcXQGukIsS/F6Y6VwgxSJFf3oShEX
         zFDq/l9lkvvGrByQoaY9vggfL9v2DfK5wNaolsSR/K9bqUZjJT9Da/wKpc8vLbHnLohN
         VjkA==
X-Forwarded-Encrypted: i=1; AJvYcCXJlW0PulR2KEYVgBCa8rLYboh7K+BKzoXzWmgzCtKiHD6F/gLjQM/Iz6KNhL+rv3sLf5YzoWKb@lists.linux.dev
X-Gm-Message-State: AOJu0YzEbJiCv1lg4I/BfCeJuxYozrepgjST0ePIV5BCH0GC0Hb6h/mz
	r0H8iZLUyhYSRPMa01qHEN/+oDg3ykXGRpazY/zUKoS4PF0pdDyyg5wh1d30SDdPYAF57I18VEV
	BQF0=
X-Gm-Gg: ASbGncsZnlsmmy/pumVoWTZhuv3Aea4zCxe7SyvmMC0EKgjko7CYXOSRIZM431kcf4Y
	X6eUgnJgkdRMoR4dtWxj6ls6Uart5/Lkw8u7rjwIkvC7+Dr8MZybBx4xSavcs8BI9F/AlP3w+CH
	eqlvD2pkgsuXw9/jioeE/mktdEaWymjzFjX08f/+j8UyUwoxiH2Wwp5NdocW577GXzV2fyFaAQK
	JP8kB1bLvUEcDT0jdpXnF9PtkDH7TCYIcOJpS1zvmbz7L0kfL6AHPpkVBBN+aKbt7a+kFEYMV0d
	SYmt63pZfEsyWeaFJn6nyZsRj/EHBhb4R+OKgcGh30//lHYfsCd8J4nB3AOzQHW+BkvW5Nt0o5V
	DHRcopFzcD7UyoAh53j4uYXtFDhhmnLNuDrsJODBbmIK5wD38ZOxM9FVft6HeiDVr5Dhy2UTdmc
	IKxdMeeu1fA4NMBUoMmkkXCIjjDljwFXeWKj0lCZkQUJPI43LBHJ7v2A==
X-Google-Smtp-Source: AGHT+IFJUg8Z/AH0IgM/3dMihDLrSOajsLwq+WnDJjQT1eQQxYBrJAAS7A2Ixm8tZ3ahqOIDERBuDw==
X-Received: by 2002:a17:90b:3844:b0:32b:6820:6509 with SMTP id 98e67ed59e1d1-33b51149214mr39578835a91.9.1760568698758;
        Wed, 15 Oct 2025 15:51:38 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com. [209.85.215.181])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61ac7af3sm20781528a91.17.2025.10.15.15.51.38
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 15:51:38 -0700 (PDT)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-b6271ea3a6fso33057a12.0
        for <ksummit@lists.linux.dev>; Wed, 15 Oct 2025 15:51:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXN3ORHdDocdxmhQamb2GMuzyTWedSPD3em1SB1VtY+yI6p0bbP0lpXm3IpIru+mVleQz6OseqN@lists.linux.dev
X-Received: by 2002:a17:903:b0e:b0:273:240a:9b6f with SMTP id
 d9443c01a7336-290272c31b3mr374548065ad.39.1760568692654; Wed, 15 Oct 2025
 15:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a7878386f3546ba475cdf7250ab4f5a6af2a1676.camel@HansenPartnership.com>
 <CAD=FV=VK0OLj5ASxtUZAUEK1WTxDW9LwCR+yBEKD6AdUyWkNNA@mail.gmail.com>
 <68ee73dcd10ee_2f89910075@dwillia2-mobl4.notmuch> <2025101448-overtake-mortality-99c8@gregkh>
 <68efd54da845e_2f89910071@dwillia2-mobl4.notmuch> <20251015-versed-active-silkworm-bb87bd@lemur>
 <CAHk-=wiLMH5QBF+veebJgdh=e=Q5uz7AEF0sfWPRhSAXvg8ASg@mail.gmail.com> <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
In-Reply-To: <CAHk-=whCgsMuZ8heJ6ma3hCM_reG9+VYWfXorC=14n59TWg22g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 15 Oct 2025 15:51:20 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzpQC28W6TVEAhWPd3EPS57j3kY9XA6GrDeyF_03Cw0g@mail.gmail.com>
X-Gm-Features: AS18NWC6910vcJOOkDd72p91Tr9Ima6e1I0EjqJo4X4S8eYulqTMM1bz1z220IY
Message-ID: <CAD=FV=XzpQC28W6TVEAhWPd3EPS57j3kY9XA6GrDeyF_03Cw0g@mail.gmail.com>
Subject: Re: Replacing Link trailers
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, dan.j.williams@intel.com, 
	Greg KH <gregkh@linuxfoundation.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Oct 15, 2025 at 12:17=E2=80=AFPM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, 15 Oct 2025 at 12:15, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > (The above script is "tested" in that I verified that yes
>
> .. premature 'hit send' situation. That should have said
>
>  ..that yes] I verified that it superficially works, but didn't do
> anything exhaustive.
>
> It was obviously meant as a "look, you can do things like this", not
> as a real fully fleshed out solution.

Just to be clear: this doesn't solve my problem because it relies on
_everyone else_ to change in a way that's much more complicated for
them. As Mark said, the person that needs to reference the "Link:" tag
(me / others replying here) is not the same as the person who needs to
add the "Link:" tag (maintainer). It was hard enough to convince
maintainers to make a tiny change to their workflow to add the "Link:"
tag in the first place. Convincing maintainers to add a complicated
git hook that only adds the link tag if it happens that the commit
"git patch-id" they're going to push doesn't match anything on the
mailing list? Yeah, no.

Given the number of people who have continued to reply to this thread
after the commit-hook suggestion you provided, I'm going to assume
that others agree that the git commit-hook is not a good solution to
the problem we're all trying to solve.

-Doug

