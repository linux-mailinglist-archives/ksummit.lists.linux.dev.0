Return-Path: <ksummit+bounces-1303-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B890AE1E
	for <lists@lfdr.de>; Mon, 17 Jun 2024 14:42:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6716282D2D
	for <lists@lfdr.de>; Mon, 17 Jun 2024 12:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C9C196451;
	Mon, 17 Jun 2024 12:42:32 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB68195FD2
	for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 12:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718628152; cv=none; b=uJtMQ3G5eS7tia2R9kWzzCF40ZOWJ3ckD0l31D/DLTpHtW3f+btWsWGmM9idts5OLDXzFn7kt7zlmiI+t0p0Uk88JKIJA33tSLFnQPtaDkE0bEXUa8KnBLIdAx6E1TpYg28TbmybM6PScV+GrcuNrNpJ0ErOtHEXxEqOUORGxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718628152; c=relaxed/simple;
	bh=OkPNnDru5dLltb3vqbbGpWbAThDn8620cygdR0OD388=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nm8iwL1fp1iE1PnSzcw73zHQUwQMlm0Y4hYfOv45atCcHsRnkkCMmTQRM8mXaM5vmXA8o/ySQo/PnKJsKdJkeGCjCwUdgetU8L3HfJl0RqLHXNDIYEgDtzENaWe7K/bZhu59AGAqR67kTobju0ayrtrGXFvFOOcB/jgZf2FfTfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-63036fa87dbso31750647b3.1
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 05:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718628149; x=1719232949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiWkYfcwUnuicdGhD71S0ONfaTBk94gBdko52jynEQI=;
        b=Z5uNTGXLf6exiWQ2MPYfkzPa84jcjRK1mIEYNngt66EY4m4d0GzVwa0FdW4JV2wvcR
         ZDVk7VZxK93g94DOxWKUXMI4c9Dm0xo09O+JCwwLa9boIQ8S9RvrrL9vyiM1VbAoW2QX
         c5UlBKexfQP+j70gnS3w6yglRYaJnS+U4XYqDTbaIDDcEo32tDk4E11xTo+fzzbJ8z34
         CXPUNV1YZEGRGyb1qicFIXbyWwOklCcP8akb6B91DC3ifM615YpNAPy5Bw3MlC0GMHcY
         q8Vd3UcpXCrSi7j+K6YQmIyTF+u5WT+oG5F8SoXtPa+rtyf5cxHTq/D7pPJ6MxDpslSW
         X0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwapUdXUbg7hNBRxYM+GfYM7R5Xcg9rLoME8W4tf+zilByXMgNH67g3gM+DRqaCZAlxFCeUlvMOX5PDYVND48aXQiLXitpdw==
X-Gm-Message-State: AOJu0YyPtNmNKKlueB2UMrQPj9Z9U3FwH3rBs9wrXg1u2m/vUrzw9ib1
	UxPQPi1dtsABGF8kQKE8le0w+u9Mxl88ReMOcJFPPRHQjzzxk045gah+IYay
X-Google-Smtp-Source: AGHT+IH2oPz0BZ1X8miKVdN8hJA6jM5Qd0Cxa9QJm6008Px1HdyTDUdrYBHJ44kzLUmljUwZqUgNsw==
X-Received: by 2002:a05:690c:72c:b0:61b:e506:b0f with SMTP id 00721157ae682-630bc213c69mr81076437b3.4.1718628148699;
        Mon, 17 Jun 2024 05:42:28 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-63118e9917asm13874467b3.60.2024.06.17.05.42.28
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 05:42:28 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-62f3ccc877eso35055967b3.1
        for <ksummit@lists.linux.dev>; Mon, 17 Jun 2024 05:42:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwrIkbq3xfXznZuR4z3Ht7fKJglUGBQ9cmzhxaycZIRoH+r8tvr6lbvwg8HHmh/H9qimFdzHceHm+/tFkWp238+XLl/J+FrA==
X-Received: by 2002:a81:a783:0:b0:618:48ab:e597 with SMTP id
 00721157ae682-6320490712bmr56999767b3.8.1718628148176; Mon, 17 Jun 2024
 05:42:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c6be1b86-f224-417c-a501-6c778999a04f@leemhuis.info>
 <e7f9ae0f-7635-4bf7-827b-bad2d58bf228@leemhuis.info> <20240613095917.eeplayyfvl6un56y@quack3>
 <20240613-rustling-chirpy-skua-d7e6cb@meerkat> <87plsjoax6.fsf@mail.lhotse>
 <20240614-almond-lorikeet-of-reading-6d959f@lemur> <CAMuHMdXS4E3sfzcmBE0G8x4-G7tY==rZvMy269bSbV3LoYTQSA@mail.gmail.com>
 <87o77zho3v.fsf@intel.com>
In-Reply-To: <87o77zho3v.fsf@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jun 2024 14:42:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUdK-v2HA03Pyt8kv83YnNy7J=eSyFWg_QcASq3bUpMww@mail.gmail.com>
Message-ID: <CAMuHMdUdK-v2HA03Pyt8kv83YnNy7J=eSyFWg_QcASq3bUpMww@mail.gmail.com>
Subject: Re: [MAINTAINERS SUMMIT] [4/4] Discuss how to better prevent
 backports of commits that turn out to cause regressions
To: Jani Nikula <jani.nikula@intel.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Jan Kara <jack@suse.cz>, Thorsten Leemhuis <linux@leemhuis.info>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jani,

On Mon, Jun 17, 2024 at 12:15=E2=80=AFPM Jani Nikula <jani.nikula@intel.com=
> wrote:
> On Fri, 14 Jun 2024, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > That's also why I detest people putting patchwork URLs instead of
> > lore URLs in the Link:-tag: finding the thread in lore requires one
> > more click on "mailing list archive" (for patchwork.kernel.org)
> > or a copy-'n-paste of the Message-Id (for oh-the-horror
> > patchwork.freedesktop.org; and what if freedesktop.org goes away?)
>
> More than 99% of the Link: tags pointing at patchwork.freedesktop.org
> have Message-ID in the URL.

Sure, I can extract the Message-ID from either the URL or the
patchwork web page. But it requires more work from my[*] side
(compared to commits from all^Wmost other subsystems).

[*] Optimize for the (many) readers, not for the (single) writer.

Thanks!

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

