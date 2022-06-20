Return-Path: <ksummit+bounces-669-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [139.178.84.19])
	by mail.lfdr.de (Postfix) with ESMTPS id 4285D551226
	for <lists@lfdr.de>; Mon, 20 Jun 2022 10:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 352122E0A25
	for <lists@lfdr.de>; Mon, 20 Jun 2022 08:08:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44757F4;
	Mon, 20 Jun 2022 08:07:56 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19337E6
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 08:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655712474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MRuiCHV1h1tEgEcdgJwb9hbq1vM/dIHh+2LbCdwn7Ng=;
	b=e7nVcQNE8nQ6sppKwTLkOL0Alo9IB5oVEoVZDTbrKtpuu6IBqxZqXHVO3bUh/eqlttWw/O
	VKMPS61OgIo53pvjB89OIo+Jwq4QpVGinFblJJMJHv83IQEHNbp36P1PNOMeEXyPJJS3pe
	57h6IAT+coliBpXO+wggKm7ftQ9Fcpc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-5Nu3XsXpN42hGRf2HzjKbA-1; Mon, 20 Jun 2022 04:07:52 -0400
X-MC-Unique: 5Nu3XsXpN42hGRf2HzjKbA-1
Received: by mail-ed1-f71.google.com with SMTP id w22-20020a05640234d600b0043559f4c95aso7043551edc.18
        for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:references:in-reply-to
         :content-transfer-encoding;
        bh=MRuiCHV1h1tEgEcdgJwb9hbq1vM/dIHh+2LbCdwn7Ng=;
        b=dqLWrjZWH4rZsYqOjEgkTg7H2JTRofwZEhFGrG9xqYq/nJ4jE/SKpyai1JkWP57/kW
         VBbQZ9aLai+MprxaUhF/EVYh76nKTZJoNU6i+xmMOW3XKT8iyyZhV6WR3cGVZbK4sIVt
         4oxFBAJH+SCCZAomrx7CeU6vZpYZM7lpvox5dSdboRtArY0wcR7Lat0Jw9PXjyBBtfMj
         1Nfl2gGw6lfxywIb1t8J/olvgKIwOY3xXHPO0oGPEVLqg91s5bSpF32CQuEFK9F7Sslv
         SJdNZnKEJrUY3QedO+Qf0d/1qJFDuJyrRlJTAQVmPSTgnromrnUkHTH4Nrsb0+tZ6RhA
         WWvg==
X-Gm-Message-State: AJIora+JiG8S90byKM+1OBy350q/ryGbUNqzOkEqelAVhP4M70IQIUsU
	LNGKMUKe8zWvxGcLtJA7/E5CbEdrBjUWhDxg6psYGstuQD1jcQShaRmLOkt4vjYqPGR2TheRWdz
	z/UzUh8Qi7j3AZKTnv9VQDEPH/wO0FWJVnD7mKpz/Y2TMOCfqNQZSC5tjxFg6R5dXK+4Y8A==
X-Received: by 2002:a17:907:3d8a:b0:710:c2e8:79f2 with SMTP id he10-20020a1709073d8a00b00710c2e879f2mr19234556ejc.577.1655712471207;
        Mon, 20 Jun 2022 01:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tDTxbe91OKorE1veXoV97dytZExRjRfjxvp4KjlXQ6rUK3lEvi7jTJbehMb4F3CTgqmOwzOw==
X-Received: by 2002:a17:907:3d8a:b0:710:c2e8:79f2 with SMTP id he10-20020a1709073d8a00b00710c2e879f2mr19234543ejc.577.1655712470922;
        Mon, 20 Jun 2022 01:07:50 -0700 (PDT)
Received: from [10.87.1.19] ([145.15.244.207])
        by smtp.gmail.com with ESMTPSA id w1-20020a170906480100b006fe9f9d0938sm5569346ejq.175.2022.06.20.01.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:07:50 -0700 (PDT)
Message-ID: <6a252f40-9a84-1b6a-12a0-eb0a9eeec6c0@redhat.com>
Date: Mon, 20 Jun 2022 10:07:44 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [TECH TOPIC] New userspace API for display-panel brightness
 control
From: Hans de Goede <hdegoede@redhat.com>
To: ksummit@lists.linux.dev, ksummit-discuss@lists.linuxfoundation.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <efde4273-ae38-c050-f3ed-177e175e0007@redhat.com>
In-Reply-To: <efde4273-ae38-c050-f3ed-177e175e0007@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 6/16/22 22:04, Linus Walleij wrote:
> On Thu, Jun 16, 2022 at 11:33 AM Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> The current userspace API for brightness control offered by
>> /sys/class/backlight devices has various problems:
>>
>> 1. There is no way to map the backlight device to a specific
>> display-output / panel
> 
> For userspace, using just sysfs you mean?

Yes,

> But that makes it sound like userspace needs to understand
> things like backlight-to-panel topology etc.

The linked RFC/proposal for the new API makes brightness a property
on the drm connector object, making the backlight-to-panel topology
mapping a kernel problem.

One of the feature-requests behind this API is the ability to
control the beightness of external monitors over DDC/DI this
will mean (for laptops) multiple brightness controls (one
per supported display) at which point userspace indeed needs
to be aware of the brightness-control <-> panel mapping.

Making this a property on the drm connector object makes this
mapping very explicit.

> If you add the presence of ambient light sensors to this mix
> things get even messier.

Mapping ambient light-sensors to dipslays is admittedly still
an unsolved problem, even with my proposal. But I'm not aware
of any external monitors with the capability to report ambient
light-sensors back to the connected PC (or other display source).

So for ambient light sensors for now userspace can keep assuming
these belong to the device's internal panel, like it currently
is also doing for the /sys/class/backlight devices.

For external monitors with ambient light sensors, if
anything I would expect the entire auto-brightness "stack"
to be inside the external monitor, with the possibility
to turn it on/off and set some parameters (like desired
perceived brightness) through DDC/DI . In which case
the auto setting + parameters can be made parameters on
the drm-connector object just like brightness.

And I guess we could make the ambient-light-level a drm-connector
property too. This will require some kernel glue and is a bit
outside of the scope of the current proposal. But it would
make sense to do things this way and I think this would
be a good/clean userspace API for the ambient light level
reporting which automatically solves the display mapping
problem.

> I would rather make the analogy to the thermal subsystem:
> 
> - Handles multiple thermal sensors
> - Handle linearization of measurements
> - Some accumulate and work to monitor a thermal zone
> - Handle multiple thermal zones
> - Also has cooling devices (such as CPU frequency and fans)
> - Policies are applied in the kernel to handle thermal sensors
>   and cooling devices and control them in an orchestrated
>   manner
> - Userspace can sit back and enjoy the show, but it works
>   out-of-the box. No magic thermal daemon.
> 
> Examples:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/thermal/thermal-zones.yaml
> 
> Wouldn't backlight rather:
> 
> - Handle multiple backlight devices.
> - Handle linearization of backlight intensity
> - Some accumulate and work as a composite backlight
> - Handle multiple composite backlights such as screens
> - Also handle ambient light sensors
> - Policies are applied in the kernel to handle backlight
>   and ambient light sensors together
> - Userspace can sit back and enjoy the show but it works
>   out-of-the box, no magic backlight daemon
> 
> I understand userspace will want to force backlight to user
> preferences, older people need more backlight etc.
> 
> But isn't it more compelling to handle that as a composite
> backlight device than to expose several of them to
> userspace? I imagine one big knob per screen
> 1-100 for userspace, a bool for on/off and a bool to select
> augmentation from ambient light sensors or not, the rest
> the kernel can figure out.
> 
> My point is that this is not just a userspace API, it is
> a policy extension of the backlight subsystem.
> 
> Maybe this is in line with what you're suggesting.
> I guess I just needed to mention ambient light sensors
> here.
> 
> My personal annoyance is to see several diverging
> userspace implementations of policy for using ambient
> light sensors with backlight. It is already annoying,
> Android has something etc.
> 
> I understand that this drives a truck through the old mantra
> to keep policy in userspace, but so does thermal already,
> so I'd just ask myself what makes most sense.

I'm actually a firm believer in keeping policy in
userspace, especially for something like panel brightness
control.

There not only is an ambient-light sensor to take into
account (with multiple possible algorithms to deal with
+ various knobs to tweak the algorithm) but also e.g. dimming
the brightness when the machine is idle (no user input for X
amount of time), when the battery goes below a certain treshold
(battery saver mode) and when enabling the new-fangled builtin
electronic privacy-screens.

And more use-cases which impact the brightness control might
popup in the future but just the above list is IMHO complicated
enough to leave this to userspace.

Thermal is different because letting things overheat is really
really bad, so the kernel really must get involved here. But
in general I do believe keeping policy in userspace is best
(when possible).

E.g. we also don't have any sound volume-control policy
in the kernel and IMHO brightness control is more like
sound volume-control then like thermalzones.

Regards,

Hans



