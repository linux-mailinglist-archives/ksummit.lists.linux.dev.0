Return-Path: <ksummit+bounces-646-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id BA10054EA7B
	for <lists@lfdr.de>; Thu, 16 Jun 2022 22:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 3E3CE2E0A3E
	for <lists@lfdr.de>; Thu, 16 Jun 2022 20:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69606AAF;
	Thu, 16 Jun 2022 20:04:17 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00536AA6
	for <ksummit@lists.linux.dev>; Thu, 16 Jun 2022 20:04:15 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id k2so3952936ybj.3
        for <ksummit@lists.linux.dev>; Thu, 16 Jun 2022 13:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pFC/M0dgYgLo+petakFw7xgTSMABFtg+atHZnGA7idk=;
        b=qrvZM/beMEAZ0tV2BO2whjN90hTfYJnjaJAoMlbqO6f6r6DMZ0uzOVJ1WbhDUDeKI4
         dydLJhvKSicEW3IdH2ZMuOc2ouaRXPLY4UIW5R9wq5aM+8d/sU4QW3a8Vki1Kyx8wEOZ
         zdxIb0k638ZEQCVvXkQ1GmS8Feb9mw/AQFR+O6ANInHMngjSKlkFwoLbCwB3wQtSEe//
         4ANE2VRx8JqrBHrcDcgd7onnoskhUh3m2J6J511PAo9VvkBDlnDbWJnVz01q14voi4xY
         0ldfCq+JRr8+2OpvRVYsIIi2pBPid/GjtPTM+y39fVCtxhisGDMGZ2TALowcknTOLaR0
         1P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pFC/M0dgYgLo+petakFw7xgTSMABFtg+atHZnGA7idk=;
        b=OzJ6B66/OHFlkIMywbsuSDAPdFP4raZTw629RW19LTgwsLCBJmtEu/V4GPyaFhOoKc
         PJr6EooLy/35dtTHX/6/YFsDlGOgBrP1jfT4SPOHppTlIW6gSoIOYU9kgLCHPU6ClJeY
         W6eORbXTL+dBbfXk+U39TMdfTGgdF2ova+EXE69UOcN3hRyEgfOK7c9hQIPlfyRMo52R
         Cb3sQ/r60dQI8P5AGICE2h8/7izobXXn9Bpg2/35nvrjti/MSgV99VyMm4NZAdmakc/f
         z2h/DojXfju9AwL/SppeRfTxaf6kR24HWX38UViFEoklnvg+0atAF/PwUhxvuPJORWWC
         0C7w==
X-Gm-Message-State: AJIora8QZ80MN9DOSTWuWbAqxekByvJ/6JiCUlkBnlBMt499uFlStJJP
	mZQdgmWLfm7vb7YLv+BWO/ebgEQ1diraZ+6uP+Qlig==
X-Google-Smtp-Source: AGRyM1szv5bUaqt8MXknaCAgK735ywb7jkDzYZ22CPpfhi0XCRjOOyof78Hp42d6tPiabfxd7CIDLO/AFE8pRHkPHV8=
X-Received: by 2002:a25:2642:0:b0:664:c89e:b059 with SMTP id
 m63-20020a252642000000b00664c89eb059mr7351682ybm.369.1655409854589; Thu, 16
 Jun 2022 13:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <f4a7c2c0-6137-99ff-d216-f09a56031fbb@redhat.com>
In-Reply-To: <f4a7c2c0-6137-99ff-d216-f09a56031fbb@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 16 Jun 2022 22:04:03 +0200
Message-ID: <CACRpkdaYTFBYFg_Jg1smkXn+FzgWBSk47w6UMFeAx0_VNpkqpg@mail.gmail.com>
Subject: Re: [TECH TOPIC] New userspace API for display-panel brightness control
To: Hans de Goede <hdegoede@redhat.com>
Cc: ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 16, 2022 at 11:33 AM Hans de Goede <hdegoede@redhat.com> wrote:

> The current userspace API for brightness control offered by
> /sys/class/backlight devices has various problems:
>
> 1. There is no way to map the backlight device to a specific
> display-output / panel

For userspace, using just sysfs you mean?
But that makes it sound like userspace needs to understand
things like backlight-to-panel topology etc.

If you add the presence of ambient light sensors to this mix
things get even messier.

I would rather make the analogy to the thermal subsystem:

- Handles multiple thermal sensors
- Handle linearization of measurements
- Some accumulate and work to monitor a thermal zone
- Handle multiple thermal zones
- Also has cooling devices (such as CPU frequency and fans)
- Policies are applied in the kernel to handle thermal sensors
  and cooling devices and control them in an orchestrated
  manner
- Userspace can sit back and enjoy the show, but it works
  out-of-the box. No magic thermal daemon.

Examples:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/thermal/thermal-zones.yaml

Wouldn't backlight rather:

- Handle multiple backlight devices.
- Handle linearization of backlight intensity
- Some accumulate and work as a composite backlight
- Handle multiple composite backlights such as screens
- Also handle ambient light sensors
- Policies are applied in the kernel to handle backlight
  and ambient light sensors together
- Userspace can sit back and enjoy the show but it works
  out-of-the box, no magic backlight daemon

I understand userspace will want to force backlight to user
preferences, older people need more backlight etc.

But isn't it more compelling to handle that as a composite
backlight device than to expose several of them to
userspace? I imagine one big knob per screen
1-100 for userspace, a bool for on/off and a bool to select
augmentation from ambient light sensors or not, the rest
the kernel can figure out.

My point is that this is not just a userspace API, it is
a policy extension of the backlight subsystem.

Maybe this is in line with what you're suggesting.
I guess I just needed to mention ambient light sensors
here.

My personal annoyance is to see several diverging
userspace implementations of policy for using ambient
light sensors with backlight. It is already annoying,
Android has something etc.

I understand that this drives a truck through the old mantra
to keep policy in userspace, but so does thermal already,
so I'd just ask myself what makes most sense.

Just my =E2=82=AC0.01

Linus Walleij

