Return-Path: <ksummit+bounces-1295-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C71909CAD
	for <lists@lfdr.de>; Sun, 16 Jun 2024 10:55:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80F25B21141
	for <lists@lfdr.de>; Sun, 16 Jun 2024 08:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29300179641;
	Sun, 16 Jun 2024 08:55:10 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B4178CCB
	for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 08:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718528109; cv=none; b=f1gO0ZiD1zPSDDROskVgUzAiZ5bCwwXH9G++m1cYVQuhn1adTj9YpdvoO4ruRga7Pdbr6o0YlkvC0I5y1R5gSZJ3D1XDNGJS3O2siWjCL4TKhsE94tKd8f5FRCsXTZfQSsFO3BoLQiO3w9nPCkMFI/RgXUCSjFZcDuHUvElexxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718528109; c=relaxed/simple;
	bh=6hTIHBxm99uYwuQ5O5/IfpGM5RGySXMOra/qfEAk2JQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=raSj1L8fjzbApktBXaXsdOshPBnCCSTz58Q+83HViToultgQLJtDm97/zBoPtvHcFzbQoSctu+zXaFGB9YEUw5SJRSuqUBL9gHYVSfL2v72oZFbS/KR2lig9//7PyoVVkDF/S4+IaNDXLvrNfZWiju+lPE6ORIyR7YYKgQ6ozcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-632597a42b8so20283877b3.3
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 01:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718528106; x=1719132906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hfzwey3JL6ThXClXVN71bh0nJ5EmG1wC7Vk7yuSN7pE=;
        b=XsTaqzBtbenOIUjrhT4n7G+ypGyyQxlSJEdOEhj/Y7i4lNg+j4lj7R/3wDXNrqk3cJ
         ryNy/Ts2+gDMCEWL3Io3ix+IiauWuOEy0WMH1+TevWF4xAYBeIyjVcJTVSfyx1Evx+/D
         J4VqPbSzjeqse0LV/PSjRUZI94F4/9fhIV8ngphl+buEGGuZcj7UbcDhTq36+W7ZqrtO
         F8ZSG5AhBkItkC7+AkvPzCvzc4eE0dRi41wPc8rWt/Mxnd69PPyPSan7DdWkyemZ3CRZ
         bZKCCdJNx72fuxucRNnhPioW24jAvI+ZkHyHMfz6e1cDOpnuLis7EKuioZLOXnEBfAl6
         QJ+g==
X-Forwarded-Encrypted: i=1; AJvYcCXYfMXLT4+UaRYKrti4PlONQfHRX6oIZD7mIaYyMojxv+ma6TbtOLsWzHhgFEVypxR4oSXpxRQotEItUGb+JcCPkoHUyx/14w==
X-Gm-Message-State: AOJu0Yz3MI6Lnvehh1g05L7jlB08WX+zg9Xf44ulXUuDhyy/ymEGwbVr
	GNMXCDqfB3t0tnwjI6NsdM3AqITwRgl9pZxiYlaKB+XtJAt80/AmzBi8fpuO
X-Google-Smtp-Source: AGHT+IGcgDWvyHNJlJHW3o6WxkjzJ5vExYjV0Mb4J39reDs1gyMyOpSUmmfhJxQN4m507Yki2ist0A==
X-Received: by 2002:a81:a254:0:b0:631:44fc:3f56 with SMTP id 00721157ae682-6322471020emr73068377b3.32.1718528105906;
        Sun, 16 Jun 2024 01:55:05 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118e998dasm10084997b3.65.2024.06.16.01.55.05
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 01:55:05 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dff0c685292so2937845276.3
        for <ksummit@lists.linux.dev>; Sun, 16 Jun 2024 01:55:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/CVXIv3SYHbh8TrxjINuyi175bsMUGQUp6WyRho6EafEIcQyj9dqFrj+QWMxtbOblm9McyH4rz74gzt/tiLCB6xXaM/VL7g==
X-Received: by 2002:a25:c7cd:0:b0:dfb:300:9752 with SMTP id
 3f1490d57ef6-dff153aef22mr7033850276.23.1718528105528; Sun, 16 Jun 2024
 01:55:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <CAHk-=wiD9du3fBHuLYzwUSdNgY+hxMZEWNZpqJXy-=wD2wafdg@mail.gmail.com> <nycvar.YFH.7.76.2406161026100.24940@cbobk.fhfr.pm>
In-Reply-To: <nycvar.YFH.7.76.2406161026100.24940@cbobk.fhfr.pm>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jun 2024 10:54:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5XJ=c4PnTWAKkDMgV9DF9iEmbuyWX4QCJSRPMCu6qxA@mail.gmail.com>
Message-ID: <CAMuHMdW5XJ=c4PnTWAKkDMgV9DF9iEmbuyWX4QCJSRPMCu6qxA@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Jiri Kosina <jikos@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Takashi Iwai <tiwai@suse.de>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	Thorsten Leemhuis <linux@leemhuis.info>, "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jiri,

On Sun, Jun 16, 2024 at 10:32=E2=80=AFAM Jiri Kosina <jikos@kernel.org> wro=
te:
> On Sat, 15 Jun 2024, Linus Torvalds wrote:
> > There is no excuse for that completely broken model. It's objectively
> > and unquestionably worse than having a "link".
>
> I think the 'philosophy' behind favoring Message-id over Link is that
> Message-id is set in stone forever, while Link is not.
>
> Should lore go away at some point in the future, something else will
> probably take over, and you'll be able to search for Message-id there, bu=
t
> the Link will not be functional any more (sure, you can extract the
> Message-id: from it manually).

The premise is that kernel.org won't go away.

And if it ever goes away, we map it to its replacement in our local
/etc/dnsmasq.conf ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

