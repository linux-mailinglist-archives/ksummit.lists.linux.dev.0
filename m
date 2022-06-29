Return-Path: <ksummit+bounces-739-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9328D560A45
	for <lists@lfdr.de>; Wed, 29 Jun 2022 21:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 68C542E0A7F
	for <lists@lfdr.de>; Wed, 29 Jun 2022 19:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 239576AB6;
	Wed, 29 Jun 2022 19:26:14 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A8D7A
	for <ksummit@lists.linux.dev>; Wed, 29 Jun 2022 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656530771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gs9cTyMCyhU49EAK0OQuElnisRzUkQ2lwCW1yulQvEg=;
	b=ZFWZ7zIbMMhKvlM2asJUWcQBQv4vMpx1MNnyg0BfAHy9xZrwZljSaGDhPXHN4Sy4ZZiob/
	zGkjZ1JZK5EQxKuUOLCuvuTwSiv81r1HBMYFe4BFNyHR0QYDK3sDNrGSRY2ENI86CSkXJr
	8E3KqUAkUn/Psg47qpTmBzn/fIHki/Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-462-4RHMvYXwNmujnQ6zSQoCPg-1; Wed, 29 Jun 2022 15:26:09 -0400
X-MC-Unique: 4RHMvYXwNmujnQ6zSQoCPg-1
Received: by mail-ed1-f70.google.com with SMTP id z17-20020a05640235d100b0043762b1e1e3so11208842edc.21
        for <ksummit@lists.linux.dev>; Wed, 29 Jun 2022 12:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gs9cTyMCyhU49EAK0OQuElnisRzUkQ2lwCW1yulQvEg=;
        b=FPa8vnDkfmayirBd/ZMbvFF31ZdmsBhMO2IyuSCDP93+JECXzyoAwAFEagg2FDuAtr
         b7jOhQwo2Y34JGRW2xqdJ4YH/efxyO+wDM1EgqLUyAXnJQsOhVukyp1QtcPyRSZNjPsr
         M5XOMYf6m++1bOo5GS9kAIPXk8a35vDG4fJna9eudff7GOgv65PCAc4KAVvbqhYFFE2q
         qhrJwiQVvW66hIgvVD+svCbOjHKP+j2voFXK2iP3/q//Cb2FpxA1ZAScBMlM7oib/mL+
         ViIyX3dBN2VdunvsWY4KdcRYIMhZfHH4ct/lQVTB0Adxhab/T3BxXvch66Jh2pQ82MKM
         ylWw==
X-Gm-Message-State: AJIora+M2zz56vQ+hgC4revx/1DPSgl6ERCnheZ2puo+UyNM2pdHy7se
	VFd4pOJEyS9YnmUDs6HnM5BKuFLfXJT9TJsSw76wqOszmBuxcaj3wKExzjxeFmffJ4sjJa1khE5
	fAkIWCg/DwAPYjrL8eQ==
X-Received: by 2002:a17:907:7603:b0:72a:4271:5cef with SMTP id jx3-20020a170907760300b0072a42715cefmr2983106ejc.454.1656530768147;
        Wed, 29 Jun 2022 12:26:08 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u4EC/lokCui0H9GmbFkZoQ7jrZ6kXSQ4sD0uNhYnkVb3KdBZ+wJ4zQHAfd6sbjaBy4cYNbIg==
X-Received: by 2002:a17:907:7603:b0:72a:4271:5cef with SMTP id jx3-20020a170907760300b0072a42715cefmr2983093ejc.454.1656530767927;
        Wed, 29 Jun 2022 12:26:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e5-20020a056402088500b0043566884333sm11770858edy.63.2022.06.29.12.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 12:26:07 -0700 (PDT)
Message-ID: <011bf067-8e5f-6105-6989-fffcada1e395@redhat.com>
Date: Wed, 29 Jun 2022 21:26:07 +0200
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
To: Jani Nikula <jani.nikula@linux.intel.com>, ksummit@lists.linux.dev,
 ksummit-discuss@lists.linuxfoundation.org
References: <efde4273-ae38-c050-f3ed-177e175e0007@redhat.com>
 <87k090rj1a.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87k090rj1a.fsf@intel.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/28/22 15:53, Jani Nikula wrote:
> On Mon, 20 Jun 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> <resend to both lists, because of confusion of which list to use>
>>
>> Hi All,
>>
>> As requested here is a copy of my LPC kernel summit track submission:
>>
>> Title: New userspace API for display-panel brightness control
>>
>> The current userspace API for brightness control offered by
>> /sys/class/backlight devices has various problems:
>>
>> 1. There is no way to map the backlight device to a specific
>> display-output / panel
>>
>> 2. On x86 there can be multiple firmware + direct-hw-access
>> methods for controlling the backlight and the kernel may
>> register multiple backlight-devices based on this which are
>> all controlling the brightness for the same display-panel.
>> To make things worse sometimes only one of the registered
>> backlight devices actually works.
>>
>> 3. Controlling the brightness requires root-rights requiring
>> desktop-environments to use suid-root helpers for this.
>>
>> 4. The scale of the brightness value is unclear, the API does
>> not define if "perceived brightness" or electrical power is
>> being controlled and in practice both are used without userspace
>> knowing which is which.
>>
>> 5. The API does not define if a brightness value of 0 means off,
>> or lowest brightness at which the screen is still readable
>> (in a low lit room), again in practice both variants happen.
> 
> 6. It's not possible to change both the gamma and the brightness in the
> same KMS atomic commit. You'd want to be able to reduce brightness to
> conserve power, and counter the effects of that by changing gamma to
> reach a visually similar image. And you'd want to have the changes take
> effect at the same time instead of reducing brightness at some frame and
> change gamma at some other frame. This is pretty much impossible to do
> via the sysfs interface.

Ack, that is a good point.

Regards,

Hans



>> This talk will present a proposal for a new userspace API
>> which intends to address these problems in the form of a
>> number of new properties for drm/kms properties on the
>> drm_connector object for the display-panel.
>>
>> This talk will also focus on how to implement this proposal
>> which brings several challenges with it:
>>
>> 1. The mess of having multiple interfaces to control a laptop's
>> internal-panel will have to be sorted out because with the new
>> API we can no longer just register multiple backlight devices
>> and let userspace sort things out.
>>
>> 2. In various cases the drm/kms driver driving the panel
>> does not control the brightness itself, but the brightness
>> is controlled through some (ACPI) firmware interface such
>> as the acpi_video or nvidia-wmi-ec-backlight interfaces.
>>
>> This introduces some challenging probe-ordering issues,
>> the solution for which is not entirely clear yet, so this
>> part of the talk will be actively seeking audience input
>> on this topic.
>>
>>
>> Comments:
>> This is a duplicate submission with one which I submitted for
>> the "LPC Refereed Track" before the "Kernel Summit 2022 CFP" posting.
>>
>> I recently send a RFC email about this to the relevant mailinglists:
>> https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/
>>
>> As well as another RFC laying out some initial backlight code
>> refactoring steps. As there is a bunch of technical debt which
>> needs to be addressed before work on a new uAPI can even begin:
>> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>>
>> I'm working on the refactoring now. I believe the refactoring
>> is more likely to land in 5.21 then in 5.20. Let alone that
>> the new uAPI on the kernel side + the mandatory userspace code
>> consuming the uAPI will be ready before plumbers.
>>
>> IOW I expect this to still be very much in flux during Plumbers,
>> so this won't be a presentation presenting only already finished
>> work.
>>
>> Regards,
>>
>> Hans
>>
>>
> 


