Return-Path: <ksummit+bounces-645-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFCD54DE36
	for <lists@lfdr.de>; Thu, 16 Jun 2022 11:33:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0619280A86
	for <lists@lfdr.de>; Thu, 16 Jun 2022 09:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64DB717C7;
	Thu, 16 Jun 2022 09:33:04 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675357A
	for <ksummit@lists.linux.dev>; Thu, 16 Jun 2022 09:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655371981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LiGVR7v2g9lab50ju2zn22UnoWu60NCsbbrkIN4f+u4=;
	b=QVzSahXAu3CgiOaDTtPIpz/QH6zHVsFrjqB2W8pdLAd5oZm3L3xIVQAoKpHRZgm2PWQLOz
	cHZw1bE0wfliGEwYLXNOpRUybc9aPYLffaGsnJypXwidqDpkgZ7HP8SBBWRbP+RE8fe9Na
	9bEjrfEcxJc6LEEiRoxwfuvi783juhM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-a6nITDP_PuO7s6UCWBNKZg-1; Thu, 16 Jun 2022 05:32:59 -0400
X-MC-Unique: a6nITDP_PuO7s6UCWBNKZg-1
Received: by mail-ej1-f72.google.com with SMTP id pv1-20020a170907208100b00710f5f8105cso378134ejb.17
        for <ksummit@lists.linux.dev>; Thu, 16 Jun 2022 02:32:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:from:subject:content-transfer-encoding;
        bh=LiGVR7v2g9lab50ju2zn22UnoWu60NCsbbrkIN4f+u4=;
        b=F6AMFLEdOJ8pMxBpu/exGIkgf+n0zGBfzA1FubvWAa6toZwNlpoXuaXYD7mzOMQfNL
         8nHRnW/XPLNkeqNEFTvWO860JRLTMNsr3E8JHd2uRFVPmpE+GrVP/Yvemyiph1jtAz9z
         XvM1g/oBaEKuO/cHEgsENFUYFSEc+7EEGPZTq41CcKae/c6NyUquMDEqVa2BQua+j4M6
         eyDcNAz4l0XdGxaHrDX7Hp557Ife6j4Nhz60BAvVKlD043YRr72rUdC0GdONpmtvh4i0
         Feiy5CmKb3trLs8HRnuey8t+QDPknFFHIcxzbe06vijC1HliyqsVP4/WWtTQFyhJeiwv
         pmOQ==
X-Gm-Message-State: AJIora8TXdet1Svbar+nSreRDAFTH4/7hi4okbZN6rusFxGDZvO3Gu+S
	fnwTN1wdrWcS+IuwXkUXSXSjxH2/F//6YuH/Ib8FoUq2jTaCFbPHzuZxxiMG6nzEdoH2CxsajeJ
	pyM49ZHj8OVhLfjMt80qqpIs4ouMyb5pjU+9+VMJkxpQ4ebSeXaHZkQnHOBrESN9CzlcpQg==
X-Received: by 2002:a05:6402:1914:b0:430:b941:2c44 with SMTP id e20-20020a056402191400b00430b9412c44mr5265390edz.77.1655371978524;
        Thu, 16 Jun 2022 02:32:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ssBKBrpqA0zumeOiEx47csV84gLr/qLXCm9WYkwotkl70tW6X47TSctj1lUrOt1CK1Idwufg==
X-Received: by 2002:a05:6402:1914:b0:430:b941:2c44 with SMTP id e20-20020a056402191400b00430b9412c44mr5265358edz.77.1655371978219;
        Thu, 16 Jun 2022 02:32:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f16-20020a17090631d000b006f3ef214d9fsm563929ejf.5.2022.06.16.02.32.57
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 02:32:57 -0700 (PDT)
Message-ID: <f4a7c2c0-6137-99ff-d216-f09a56031fbb@redhat.com>
Date: Thu, 16 Jun 2022 11:32:57 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: ksummit@lists.linux.dev
From: Hans de Goede <hdegoede@redhat.com>
Subject: [TECH TOPIC] New userspace API for display-panel brightness control
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

As requested here is a copy of my LPC kernel summit track submission:

Title: New userspace API for display-panel brightness control

The current userspace API for brightness control offered by
/sys/class/backlight devices has various problems:

1. There is no way to map the backlight device to a specific
display-output / panel

2. On x86 there can be multiple firmware + direct-hw-access
methods for controlling the backlight and the kernel may
register multiple backlight-devices based on this which are
all controlling the brightness for the same display-panel.
To make things worse sometimes only one of the registered
backlight devices actually works.

3. Controlling the brightness requires root-rights requiring
desktop-environments to use suid-root helpers for this.

4. The scale of the brightness value is unclear, the API does
not define if "perceived brightness" or electrical power is
being controlled and in practice both are used without userspace
knowing which is which.

5. The API does not define if a brightness value of 0 means off,
or lowest brightness at which the screen is still readable
(in a low lit room), again in practice both variants happen.

This talk will present a proposal for a new userspace API
which intends to address these problems in the form of a
number of new properties for drm/kms properties on the
drm_connector object for the display-panel.

This talk will also focus on how to implement this proposal
which brings several challenges with it:

1. The mess of having multiple interfaces to control a laptop's
internal-panel will have to be sorted out because with the new
API we can no longer just register multiple backlight devices
and let userspace sort things out.

2. In various cases the drm/kms driver driving the panel
does not control the brightness itself, but the brightness
is controlled through some (ACPI) firmware interface such
as the acpi_video or nvidia-wmi-ec-backlight interfaces.

This introduces some challenging probe-ordering issues,
the solution for which is not entirely clear yet, so this
part of the talk will be actively seeking audience input
on this topic.


Comments:
This is a duplicate submission with one which I submitted for
the "LPC Refereed Track" before the "Kernel Summit 2022 CFP" posting.

I recently send a RFC email about this to the relevant mailinglists:
https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/

As well as another RFC laying out some initial backlight code
refactoring steps. As there is a bunch of technical debt which
needs to be addressed before work on a new uAPI can even begin:
https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/

I'm working on the refactoring now. I believe the refactoring
is more likely to land in 5.21 then in 5.20. Let alone that
the new uAPI on the kernel side + the mandatory userspace code
consuming the uAPI will be ready before plumbers.

IOW I expect this to still be very much in flux during Plumbers,
so this won't be a presentation presenting only already finished
work.

Regards,

Hans


