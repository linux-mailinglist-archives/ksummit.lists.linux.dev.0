Return-Path: <ksummit+bounces-268-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [IPv6:2604:1380:1:3600::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 128123BDE7A
	for <lists@lfdr.de>; Tue,  6 Jul 2021 22:36:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 18E981C0EC3
	for <lists@lfdr.de>; Tue,  6 Jul 2021 20:36:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598A42F80;
	Tue,  6 Jul 2021 20:36:29 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F180168
	for <ksummit@lists.linux.dev>; Tue,  6 Jul 2021 20:36:28 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id a18so16635lfs.10
        for <ksummit@lists.linux.dev>; Tue, 06 Jul 2021 13:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B5B5PILNSl3DCnq05/J/BhgQn6x6Nm/DF+61MERybY0=;
        b=gynA8R4XrCZAydxKA2wWOL7IvMAVRDGnZWneXHS14vos888+hkppTnwG/U+wSAljJh
         2AQIXq7F+3PTYRXLCHa/Abqt+kPw3pNW2ydSUenIh+OM66k4ntalH56sbYy4EPlZWsEn
         AlEECLBNwdbFo+0f49OhbwzD+q6Ph+xRWCalyeEhw/ERJnVoU++z0CUT5xggwhlKWRKP
         BjaWAY75CZMX7UAtg+xs04eRBQdjniMV3ULf17ygtr0eC5jIOIftSvdYn//9+Jnr3XcS
         anBwx/+hsF5BnGNnqxfdhOVGET0a8BAzKo4mi/9Rd9co/VKNhWQDrm8P85DOM9Gc5WaT
         UIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B5B5PILNSl3DCnq05/J/BhgQn6x6Nm/DF+61MERybY0=;
        b=bVrJiRXpZyrqfumhDls7HPebjpl95xOnzmdI252e4A0jCRPOsk1eMQFfKejYNVcott
         4coZdag0RQsVoObQuM4ltTAidv7E/S7ufz07mTU+6ndLIT3Ik+OxAy0CeDV9i40O7F6w
         rVrOn5T7XqT9jIHOS5LMX81QhtWMTnvpdN/TpeR/txKZ7TyEpj3dwpkqtMRS9lzt2QFN
         8jV9eZmUj0juEFfUQRZg21tAhqmPK/lX8N2rm9gCrufMROIPc6qa5EY9WFKAtr7/4B9L
         rvFj84Al7Am8YCXGhIcazlML/uex4bPtjbKoJX0CcV9ZZg97ZnZ2OFt1kMbfhL8kWzsE
         6Nqg==
X-Gm-Message-State: AOAM530NYF0R31V4LeB4MrJg+RdoqA7mdy75DS+OP2sMUh1q2e7l1865
	lWFisnhP6i+uhfIkAfs82lyJnIcMvrqoZFwMWtOORg==
X-Google-Smtp-Source: ABdhPJzuGep5/VvDWoyBB1O6rgebJhoIIgKzGczu9v/tQqpyLizM7aDZNNNNVk47kRHM1mWS+A1qjStFdFiDOLY1uLo=
X-Received: by 2002:a05:6512:e99:: with SMTP id bi25mr1597304lfb.649.1625603786068;
 Tue, 06 Jul 2021 13:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANiq72kF7AbiJCTHca4A0CxDDJU90j89uh80S3pDqDt7-jthOg@mail.gmail.com>
 <CACRpkdbbPEnNTLYSP-YP+hTnqhUGQ8FjJLNY_fpSNWWd8tCFTQ@mail.gmail.com> <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
In-Reply-To: <CAG4TOxMzf1Wn6PcWk=XfB+SV+MHwbxUq8t1RNswie5e3=Y+OXQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 Jul 2021 22:36:14 +0200
Message-ID: <CACRpkdZyJd0TW5aVRfxSSWknzCyVhjMwQuAj9i9iuQ6pW9vftQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Rust for Linux
To: Roland Dreier <roland@kernel.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 6, 2021 at 10:00 PM Roland Dreier <roland@kernel.org> wrote:

> One area I see where Rust could make a big improvement for drivers is
> in using RAII for error paths.  Drivers often have a lot of code like
>
>     if (something())
>         return err;
>
>     if (something_else())
>         goto undo_something;
>
>     if (a_third_thing())
>         goto undo_two_things;
>
> and so on, which is difficult to get right in the first place and even
> harder to keep correct in the face of changes.

Yes.

> "devres" / devm_xxx was an attempt to deal with this in C, but it only
> solves some cases of this and has not received a lot of adoption (we
> can argue about the reasons).

Really? From my point of view that is adopted all over the map.
I add new users all the time and use it as much as I can when
writing new drivers.

$ git grep devm_  | wc -l
26112

Dmitry in the input subsystem even insist to use it for e.g. powering
down and disabling regulators on remove(), like recently in
drivers/input/touchscreen/cy8ctma140.c

/* Called from the registered devm action */
static void cy8ctma140_power_off_action(void *d)
{
        struct cy8ctma140 *ts = d;

        cy8ctma140_power_down(ts);
}
(...)
error = devm_add_action_or_reset(dev, cy8ctma140_power_off_action, ts);
if (error) {
        dev_err(dev, "failed to install power off handler\n");
        return error;
}

I think it's a formidable success, people just need to learn to do it more.

But if an easier path to learn better behaviours is to shuffle the whole
chessboard and replace it with drivers written in Rust, I don't know?
Maybe?

Yours,
Linus Walleij

