Return-Path: <ksummit+bounces-2343-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CDFB53264
	for <lists@lfdr.de>; Thu, 11 Sep 2025 14:35:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2A705164526
	for <lists@lfdr.de>; Thu, 11 Sep 2025 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8532D321F53;
	Thu, 11 Sep 2025 12:35:09 +0000 (UTC)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411DC32145E
	for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757594109; cv=none; b=KEp/QiFQAvOMrMDeqXiy2tXH2unmHQP0lGbVfwyHZKJH9CxD2bIUmJzB/k4G7SoXh5gSb60Ob5yeHzrXYP3F2A/jYEI+3BOlggpqbcwSuAzQ/Q4TYW5apJndrUIjrrhu6dFUb4oacmpvDJoJRYV/SMizA/jukZ59Gna3tEv/KQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757594109; c=relaxed/simple;
	bh=nSSDMvnojR8dgjZEddE6k1RZO1GMGBF+F0rOeu2uA5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u4XyQLbqwaRPpur9OcvTjYBc4ykF/rHD/NuLAZmh87ScXyoRFqXdsk+t0UZxYMAE/wU5BiQ6EkQlXEM/IzJybJxCIrob6MoZqAmv4A1vQYBCLna2gJU6VDCLOBPgUmxbNYr6Mg9KPInUkF8qMszkmtVFBEWjtG993H+8vjxd3cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-545df2bb95dso250758e0c.0
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 05:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757594106; x=1758198906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6B7NiLr6WmSijwqDhk3ZgrXobAIKwXetA44Pjih9UIA=;
        b=mXksGlX1RSohpQp26V+J2gBbCGdzaMJ8yBSeCRTBtJtX5BeL8gz58vtRG2+kc4VM/M
         padiDv1vPUTacWu3B/AeMNq9elWsdCW+fW5aw5o9rK0ZSgazJ0n8xgXoXCLR+ZdeUGYi
         KeRoO6KQXhM/wRWwfJDztlKeFoNFvCnYfPD9PRvwTTskOGExMp0sAeKsOxzFqj/r8NaT
         JHJ0qkk4ZlIuHaX54KjJ8mDSlZyWPR8LF8KbU3962X3mHYwY/b0HO8dd3GckCTNjay3Z
         25UdrwKrrjTrLs7Dmeut6rRyOV/dDnOJI5N24TquSqI7ZFbSvyLeBmEwS0wi1I0+k5jr
         uG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFb2UPuvZVWzXVgWYz/YMfUh577Qe0O8fKUD0xyO8vfTE03BzD0rubW2tuz4aBxFHD3Vngfm+k@lists.linux.dev
X-Gm-Message-State: AOJu0YzH6rhRlP+iTSk2r8J6Fxi45qUld9IuzCJ8QNMI9JScFh9do7w9
	pd1ksyPXwUGN3Q86/Mebwbd/H9FDSFKPadriDo7UIfNd/MNicFbH1qYgd8oj8boB
X-Gm-Gg: ASbGnctLCqVkQly5SBFv9+odv6yD+yCthqUvpK8fBFd3TqmOhnYGv3WeIfNRq1yW5fR
	X2h02VpxyAKZZJ3DU4oSu/no8rzkNM5qYJrZFWjl2SGJJqf2wZmNrVE3PHw1CoJBkzby/vvVdcH
	4pmdj5gRB2e/3nWTK+ejkQ6bZiNV4pppR0t8TpCLouWQ40G9jsbtlPtmznVQ2sGaBBHZ7cQ2UpB
	2I9uFeixag+YgK/5kRthx/XumkGrErc2Ui7ILos0/BzjYVE8OsRjhq3Qmtz+2QFfIxET2FZ8R3R
	YBighTlrcTnW1NgWEGfxWEBVRr3iIbOIssFO+S1sMg08zDC85npoqriOEUGbFRpIyavrv5KObkb
	VCHkBum0YpPMKEIZLlsKs/0V7MYjTE8Ar4A1pvF8JU8eFBDfry2M53hFd3FCvqOZ+JZ9WSGk=
X-Google-Smtp-Source: AGHT+IGHkN6Kedr66nOFsQqZJ9WzR4JP4jHAgbstwK7pT6rW6Ey2nPibTKkzL4ZJtFKX9neSuZMOvQ==
X-Received: by 2002:a05:6122:c81:b0:538:d49b:719 with SMTP id 71dfb90a1353d-5473a3c38bdmr5664430e0c.1.1757594105949;
        Thu, 11 Sep 2025 05:35:05 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-54a0d1d7fb3sm225128e0c.7.2025.09.11.05.35.05
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 05:35:05 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-52e6037a484so138874137.0
        for <ksummit@lists.linux.dev>; Thu, 11 Sep 2025 05:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX6zzW1dXoCXpH1Oo/O7XNj3XFzXvI0KSXG0MDOGSPDOsp4BFuvfRXvC6HyADzaQI7jlMzOr8Ui@lists.linux.dev
X-Received: by 2002:a05:6102:26c6:b0:528:6ec3:307 with SMTP id
 ada2fe7eead31-53d149b5828mr6035956137.23.1757594105299; Thu, 11 Sep 2025
 05:35:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <299e6601-a83e-4e5d-9dd9-12ae796cd913@kernel.org> <20250911122711.GC8177@pendragon.ideasonboard.com>
In-Reply-To: <20250911122711.GC8177@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 11 Sep 2025 14:34:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXU5L+BKACpRimLXPh_+JNcCQ0sS+RbeZ0GQjg-+Ov7LA@mail.gmail.com>
X-Gm-Features: AS18NWAKk6_SoJeAMP3pfQIIweOeVrGnH0au9psLZVfz6b26vKYtTGqqOf-m8X4
Message-ID: <CAMuHMdXU5L+BKACpRimLXPh_+JNcCQ0sS+RbeZ0GQjg-+Ov7LA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] Hidden commits from next (aka why
 maintainers hoard them in backpack)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Thu, 11 Sept 2025 at 14:27, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Sep 11, 2025 at 01:04:19PM +0200, Krzysztof Kozlowski wrote:
> Linear histories have upsides, but rebasing causes pain. drm-misc is one
> case of linear history with limited pain: with dozens (hundreds ?) of
> committers, patches are pushed to drm-misc pretty much right away once
> they're approved, and they end up in linux-next. Committers do not hoard
> patches in their private trees for weeks or even days before pushing to
> drm-misc. The linear history is in this case likely a good compromise:
> it simplifies the workflow for committers, while not introducing rebases
> down the line (the only rebase operations happen right away when a
> committer picks a patch and loses the race with other committers to push
> it to drm-misc).

And after that, several of them are cherry-picked to a fixes branch...

> > Just a friendly note, Laurent, I appreciate your work and I do not want
> > to point that you committed it incorrectly. In the contrary - your
> > commit is right, but your upstream maintainer stops you from including
> > this in linux-next. My aim here is only to discuss and improve the process.
>
> I would be happy to have my tree included in linux-next. I'm worried
> that the fact that the media subsystem cherry-picks my pull requests
> instead of merging them would cause issues though. Am I worrying
> needlessly, or is that a real issue ?

I think you would start receiving "same commit present in multiple
trees with different commit IDs"-emails from sfr...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

