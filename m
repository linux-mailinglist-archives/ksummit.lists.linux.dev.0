Return-Path: <ksummit+bounces-668-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from da.mirrors.kernel.org (da.mirrors.kernel.org [IPv6:2604:1380:4040:4f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FC95511AF
	for <lists@lfdr.de>; Mon, 20 Jun 2022 09:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by da.mirrors.kernel.org (Postfix) with ESMTPS id 9750B2E09F5
	for <lists@lfdr.de>; Mon, 20 Jun 2022 07:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CC6A7F2;
	Mon, 20 Jun 2022 07:41:33 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE27E6
	for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 07:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1655710889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YXSzAxnEDHc0GzZg9LFWeAVawAuDa+9Kr9EAPzwIKf4=;
	b=JrAozWVCXo6pmmj6Uu8wIQnjqlbm0RiloTzuzfSTLTNDXO95adNdVfDdBzBKz8dHPI6omx
	1XW4+LdQRSsmwc5vEio/55tdblvtHnq+GBIRfiFADjYho5Y1cXjHj9i4+JNGDFv8h7drIz
	4s2mx3uaHiZ7hXsC5WYLyrlqxMZkbM0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-pYTGRmd5OLmobO1ZJtjjkQ-1; Mon, 20 Jun 2022 03:41:27 -0400
X-MC-Unique: pYTGRmd5OLmobO1ZJtjjkQ-1
Received: by mail-ej1-f69.google.com with SMTP id l2-20020a170906078200b006fed42bfeacso3103390ejc.16
        for <ksummit@lists.linux.dev>; Mon, 20 Jun 2022 00:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:content-language:content-transfer-encoding;
        bh=YXSzAxnEDHc0GzZg9LFWeAVawAuDa+9Kr9EAPzwIKf4=;
        b=p9j3wj2NeyED6ZPFKPcmeNSQGqxZMJSEWYg3LPN9uby/y4+2lK5vDM2bKdS8Ci4blU
         56JfAN75548U/kVBQ72lgVqZke7JUmG5o9kVaYhKy2OcIjAadGJJW+LmeBaWaIpY2M3c
         JAMTklOMCl735NMT05/+Ek8L/9TMzQucaQHd8pamD75Y7WBqI5ybjfCrJ9zAFlu+xSo7
         wdvkK2tNXW9YuKMtoywhmGSG3ngiFbHkh7SyWmuHXCNo0x0o/IyrGVYhJltISJ3KbRKD
         AjUwXJ+0bUuuuPsK4M8238BDqucHrnFEzUKGG5Pxrajz9x8ejN/ZhBlbGhL7XmhRLi8X
         jOkg==
X-Gm-Message-State: AJIora80YbLhxZdoGkoMtGVQPQAKWAVR+0UGwf9yxmG53V3xAklJWXUR
	00r02hv6yqQKofIJHk3m7KdesZ61/muF0oOprGi0mYRd/izl9uvntRWL5H7RKILB8Jv1rGC34OD
	z5J1A8+W6HTatH3ohZDoW3HQM18utMsjZD1pKDNChFD07dQD2qE3XscxMnRAfXtPSHjl1xQ==
X-Received: by 2002:a17:907:97d5:b0:706:76ba:f28f with SMTP id js21-20020a17090797d500b0070676baf28fmr19069330ejc.367.1655710886316;
        Mon, 20 Jun 2022 00:41:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v1BPks6YVizebmwVcwui0Ffl+jTRXtv22hkp4mG2ambMwVOLW+ZvnXAZD/kSCca2ZvBBOHqA==
X-Received: by 2002:a17:907:97d5:b0:706:76ba:f28f with SMTP id js21-20020a17090797d500b0070676baf28fmr19069315ejc.367.1655710885956;
        Mon, 20 Jun 2022 00:41:25 -0700 (PDT)
Received: from [10.87.1.157] ([145.15.244.231])
        by smtp.gmail.com with ESMTPSA id wi18-20020a170906fd5200b00707d11fd421sm5334857ejb.107.2022.06.20.00.41.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 00:41:25 -0700 (PDT)
Message-ID: <efde4273-ae38-c050-f3ed-177e175e0007@redhat.com>
Date: Mon, 20 Jun 2022 09:41:19 +0200
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Hans de Goede <hdegoede@redhat.com>
Subject: [TECH TOPIC] New userspace API for display-panel brightness control
To: ksummit@lists.linux.dev, ksummit-discuss@lists.linuxfoundation.org
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

<resend to both lists, because of confusion of which list to use>

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


