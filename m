Return-Path: <ksummit+bounces-2091-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 057E2B1C1C6
	for <lists@lfdr.de>; Wed,  6 Aug 2025 10:04:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D04C418C0A10
	for <lists@lfdr.de>; Wed,  6 Aug 2025 08:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A520221FF48;
	Wed,  6 Aug 2025 08:04:26 +0000 (UTC)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CAAC219A71
	for <ksummit@lists.linux.dev>; Wed,  6 Aug 2025 08:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467466; cv=none; b=oSEc8CyHyT8GWivk27jJ9ReY6UV0jVvZdXNTCcbCqn5toRo0RQI3GXPjyo47la6dpx/VpvZNc7evMsF3l+8h0Ng74C7Ti1IOnrL/Ha/sFoFhEdQ1X/46X9LEfEGCTzKNjXe7LuUdxUsZ3c8WBze3qyH0ee5zVqAMMtXgGDvr/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467466; c=relaxed/simple;
	bh=Rb8HW3zxkql6CtKGDbbrG0QJakPhMpjs5bnqLa1f85Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uvLKwX0gq2Rc4MgEFdgEbQQ7IAhgV2eDrgSzTKNU3jqUNXEIgRTZNBvxwlQ5+EGK2RLEqUoXJieFb9GVPC1SGHV8BTBGSim78sDEsnwA8WP9+FagqzftzEYkBtxwhBT5h116lowJMJw1s/TZro8AVNnoMlx4FNGMB33M0cLqBAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4fc83dda10bso1669855137.0
        for <ksummit@lists.linux.dev>; Wed, 06 Aug 2025 01:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754467463; x=1755072263;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHxfFWQNDyBNCf0oNb/ERpaGusR6nkP9PcHjL7H36ZM=;
        b=roBSL2RM4DI1vOv4a0wD/We1ARh6qi7bfMqkVUaicLy/2yHvlEaNhP/DbNWeSdMQOE
         W1xIuJe0ulSuA481XC4P+/3GwmfCI5OXw/BA0tm9fd07D9gO/TFrZb/r0oCGtJ6nT6Ts
         qhwZkzcgcwexSRHQ5DAUryoj8tbhH8CWLuycPgu/vQz2e2pgFLT+Tp+sqsK6i/w/u2YE
         6jeon4Dd0nCw4Cec1NgJ+vR3KhCn6SWQ1e1OGSIGhcZNoVW+PQpZtPmDW5czzg8YyEl2
         SOedeU1QggsAMcyayfPVIsXpJDzgqHYv+hycA9lBQSqRsAGrF3mF7tXpmt3D9xWwYp5V
         2NQw==
X-Forwarded-Encrypted: i=1; AJvYcCUOznE7krEhmd6JcxMylw7tBonfqA65y/csHNwOV7uCjDR+Lvb3GjIHfIRc5u9w4djcZqKcsZgK@lists.linux.dev
X-Gm-Message-State: AOJu0YxFn8z2uYJL3kPKUUy6EegY55ujbamYdv+/hYJai8R+CF4Otu8G
	vbcfjrMR6G365RTxtgRtMUGIa9kh5AquEkuMs91/+rhfqBmSp4KZC+P5ict09IDF
X-Gm-Gg: ASbGncvoHVA0TEV1EthTLirgpjroqm03KnMfFeQlQgVLK/7y4juc+WtnKnoOL2VHGeQ
	25CnAjWR3dPaK3u4gQHMhuU26iTCDRG3f3l1HD2p1pBNcEGQIx4WgkSCBH1k/wr3Md0nx0eavzp
	qklh0Aqdk32nnIV4ywIvGXMSyIa511TI0BGQSiWdQ+fnhNTwIOL6a5hLLbZCkFhVyoR9I9o+8vk
	meAmmedKHRXcOkxzGoM+JvtR+pgQBsywbizaAjZiUM/bR+JitQ87YsBFBfqyuLANk+wn1gYwVbW
	nqNEZyV8dZYaDLGEIN0hpliO3MMhp0AAd+eQeaq3r8b6xL53o0C0M3zN6GzEUPkjC6HB4gD1w3A
	vCmnu0wxOhLkG9pI/MxnM0C0vnCvx8c8NWgnJMsHodGUssBcEvmdAQUFsxEV/
X-Google-Smtp-Source: AGHT+IEKRwu5lle7OVJejgIhyfDbzTZbjgMNe3JweIU/DQYaGwUBZRjfhDMQhGM40OSEIueIylR10w==
X-Received: by 2002:a05:6102:5801:b0:4ec:c548:f953 with SMTP id ada2fe7eead31-50372d9fe10mr675209137.17.1754467462873;
        Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-88d8f3263d6sm3243006241.5.2025.08.06.01.04.22
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4fc83dda10bso1669848137.0
        for <ksummit@lists.linux.dev>; Wed, 06 Aug 2025 01:04:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+zNteUnYgebd5fkJlBq4wC5BKW3kkmw2WMbP0aQdaxwa6IdpqcQo3K2KIyFek0rGQM4dfGa9G@lists.linux.dev
X-Received: by 2002:a67:e7c8:0:b0:4fc:817:dca8 with SMTP id
 ada2fe7eead31-50372d9fe2dmr716867137.16.1754467462393; Wed, 06 Aug 2025
 01:04:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <162r47q9-rp56-67so-7032-2r1rn36p03n6@fhfr.pbz>
 <9dbe8a42-e43a-4beb-acfa-3ed1c069fa47@sirena.org.uk> <20250805122828.68312a8d@gandalf.local.home>
 <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
In-Reply-To: <09a8f276-916f-45e9-bd63-ffddecf1be9a@sirena.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Aug 2025 10:04:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
X-Gm-Features: Ac12FXyF9bTro4MchaPykkrrklH0TLpXt2tymFtVOZ4AvNUmsUpi7Tr2lohIMg0
Message-ID: <CAMuHMdWapDrTn6Tv=YA+s1kcT8A3TrXu2F35sPcv8RHSJyYWXQ@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] The amount of -stable emails
To: Mark Brown <broonie@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Jiri Kosina <jkosina@suse.com>, ksummit@lists.linux.dev, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 5 Aug 2025 at 18:41, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Aug 05, 2025 at 12:28:28PM -0400, Steven Rostedt wrote:
> > > One thing I'd really like to see there would be to avoid sending each
> > > patch separately for every stable version, that just blows up the mail
> > > volume hugely especially for those of us with subsystems that carry a
> > > lot of quirks.  I'm sure the range of versions something is being pulled
> > > back to could be expressed in a single mail instead, it's always some
> > > range of versions being processed en masse rather than just a single
> > > version.  The per version cover letter is more useful for replying with
> > > test results but that doesn't need the whole series.
>
> > Yes, I agree that a digest of all the autoselects would be good.

Commits are not always backported to all stable trees.  Sometimes I
receive an email about a backport, and wonder "has that still not
been backported?", only to discover it was backported, but not to
a very old stable tree.

> > Possibly even a link to the stable git tree of the commit each was added to
> > would work.
>
> It's not just the autoselects, you get one batch of mails for AUTOSEL if
> the patches were picked up that way, then another batch of mails when
> the patches are added to a queue then yet another when the stable -rc
> goes out for testing.  Possibly more that I'm forgetting, and each of
> those is per version.  Now you mention it there's some redundancy there
> too...

Speaking about the stable rc emails: can we please get the
"Pseudo-Shortlog of commits": sorted by author, just like the final
shortlog? It would save me a tiny bit of time.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

