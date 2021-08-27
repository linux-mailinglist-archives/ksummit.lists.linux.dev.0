Return-Path: <ksummit+bounces-484-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3343F91C9
	for <lists@lfdr.de>; Fri, 27 Aug 2021 03:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id B69093E10AC
	for <lists@lfdr.de>; Fri, 27 Aug 2021 01:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C85F42FB2;
	Fri, 27 Aug 2021 01:01:18 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905C572
	for <ksummit@lists.linux.dev>; Fri, 27 Aug 2021 01:01:17 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id f5so7746606wrm.13
        for <ksummit@lists.linux.dev>; Thu, 26 Aug 2021 18:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jX7m9ybnldVL72iTpIbrMd4sobiouriNXwKsn/Y6OoM=;
        b=Ad2AByRVE8m01f5b4I55PPoqprjniwQGhuibKqpMk2ywnK7IwlYr6PsavVzTrVmBSW
         7HYte8Fe4vrxLoiVz0eeMTGRWC7/ZwEf4J7/6cH6Pf4Y3W1Tx2qdM084u/IMuY5rOJeM
         N+0S5uS2tRGSQ9VizPJIIcB0AigSzKqikaEd1+bBMYFetduOs53xPO06pETwc/5MIeLs
         nVluG4MHJX+x8ozfkw0S+t8aOxmdLWTg/2vnjzGcWmLf4xFvo1EW9Bwy6Z0B+qc0WVaK
         N12Sq1lwvugNt+rt3es2kqwCVLVB8rwNfc8gins8tHyGcx1+nJ2p8drSaXGWpHriSqc4
         n80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jX7m9ybnldVL72iTpIbrMd4sobiouriNXwKsn/Y6OoM=;
        b=iCsp3kxreTmbr221z/AcHd3tZgbG0r4W8QshX+CpkysL7OWCoeGjUA8SRM3UEfl4Qg
         xM/MZv2HHIpzZIX8WQ9WX4392guehv1vw6LXt1AToN+Os6Xur1GtpaoNus6qvYO7Kudv
         cjZmJvOicmgY8zvxKYXrfWWJm+bUsZMpnAw9ppWC/yEEa5jP09dM3zXk6WVg1zOce6iM
         65MzePcjG4GmIgdaTwksC9ZCKTxSTmsq4G0Y449j/yvZVhfl9sGPoZZIry6EV1ibHrPr
         NuvQmE0WtFIWWHJSYDOUyZCbzpS00KTH5CW0gIjSRO0OKbVKGB0kxJdXV3z7LuWUQNBw
         ZnjQ==
X-Gm-Message-State: AOAM532Dr+g8KHAWjKOWi5DUbJSYNs4T206Q0xSf6JGGNkV7lCJjPKgZ
	CHUkPPEhrMjWaqvEmGK8nwlqw9wkVPxfQXeG7GESRQ==
X-Google-Smtp-Source: ABdhPJwm8I/adbh0DvCwVgh+qGi6mqycpKM4hufzrFutmu1gxQX5jN3P798uwjJKqbK0R5JkeGAtXI2DuDCB4Ld8/sE=
X-Received: by 2002:adf:eac3:: with SMTP id o3mr7086532wrn.60.1630026075607;
 Thu, 26 Aug 2021 18:01:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAEeCyJZas4LCnMWYTo9Wh49N9DoBChzG869x41BpUoZ+1JmCGQ@mail.gmail.com>
 <CACRpkdYaRALXisvqhF8VyK-m0fz9aUFrurH2u5m=9DS4L3FHXg@mail.gmail.com> <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
In-Reply-To: <YSgVPi9H4oBt5uy8@pendragon.ideasonboard.com>
From: Alex Levin <levinale@google.com>
Date: Thu, 26 Aug 2021 18:01:04 -0700
Message-ID: <CAEeCyJY8bXNQHL-kSbxrGcVwQ45kTaR9pW4eOm=ZShEwE5hFiQ@mail.gmail.com>
Subject: Re: kSummit proposal - The Linux kernel in ChromeOS
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, ksummit@lists.linux.dev, 
	Jesse Barnes <jsbarnes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the feedback Linus and Laurent.

We are willing to extend this to 90 minutes and cover the
opportunities and challenges we have WRT to SoC manufacturers
upstreaming and how ChromeOS is influencing upstreaming.

I wasn't sure we will be accepted as a ksummit so it seems that the
track for now is a MC, but that might change.

> Also: your experience with using ACPI and when firmware can be
> fixed and when it can not, and when/if the kernel has to accommodate
> quirks rather than fixing the firmware.

We can definitely touch on this topic. It might be too narrow of a
topic to discuss widely (I would gladly have a virtual cup of coffee),
but we will include in our talk the FW challenges we see and how they
impact kernel deployment, development and uprev. It goes a tad above
(or beyond?) quirks.

> Also explain what this stuff is: drivers/platform/chrome/* and why it is
> so necessarily different and can't live in existing subsystems?

This is our cros_ec (Chrome OS embedded controller) driver


On Thu, Aug 26, 2021 at 3:27 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Fri, Aug 27, 2021 at 12:07:56AM +0200, Linus Walleij wrote:
> > On Tue, Aug 24, 2021 at 3:06 AM Alex Levin wrote:
> >
> > > - Testing the upstream RC on as many platforms as we can as early as =
we can.
> > > - Updating the Linux kernel on existing platforms (millions of users =
at a time).
> > > - Managing technical =E2=80=9Cdebt=E2=80=9D and keeping the ChromeOS =
kernel as close
> > > as possible to the upstream kernel.
> > > - Current pain points in dealing with upstream.
> > >
> > > We feel 45-60 minutes would be enough and will allow a discussion.
> >
> > I think this is really interesting.
> >
> > Also explain what this stuff is: drivers/platform/chrome/* and why it i=
s
> > so necessarily different and can't live in existing subsystems?
> >
> > Also: your experience with using ACPI and when firmware can be
> > fixed and when it can not, and when/if the kernel has to accommodate
> > quirks rather than fixing the firmware.
>
> Could this also include lessons learnt related to convincing and helping
> SoC vendors to upstream drivers ?
>
> --
> Regards,
>
> Laurent Pinchart



--=20
-Alex

