Return-Path: <ksummit+bounces-628-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C7D414A0E
	for <lists@lfdr.de>; Wed, 22 Sep 2021 15:03:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id D63E21C0F1F
	for <lists@lfdr.de>; Wed, 22 Sep 2021 13:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F183FCC;
	Wed, 22 Sep 2021 13:03:03 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41B672
	for <ksummit@lists.linux.dev>; Wed, 22 Sep 2021 13:03:01 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id a10so8952148qka.12
        for <ksummit@lists.linux.dev>; Wed, 22 Sep 2021 06:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=Mzti7OcQhNV5Y7jNBpCwNPoM5QFEKkHFwpOXiZ924fc=;
        b=kXJ70SnnTkMcZ3kA/YBszIZENe7dzrkdheh0c8M5ORy+56Hu38qdXncuv0FI9RAejb
         XQ0TWhSZbJEv0LBsxPk4s9yUfk8FtZYLYb/CllmXeqpKaBYJNoDi5zwTrcWKrI82+P2j
         6MOI1FXElrpMc1sxkqKdScJkUoPSIY3uDhToA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=Mzti7OcQhNV5Y7jNBpCwNPoM5QFEKkHFwpOXiZ924fc=;
        b=VbY8uYBZIHh5hHb0ztBIDPmZpROCASABnK5kTYOBR/ivbQM8rSoN+SR38AiNpGwYp4
         oGhlWaCDNzAGm5xf1Mibt1uHIKGW9s8XS/4UlN5hNjdB000bIiT8BjXbOwobQ36pfrWs
         x1rIVfq7VLAgWmxqL6dMTLRgFUanNt4m1LDe3UE4fX8eeVd3qSy3XXEOngXpukv/K86D
         btgLP7jhex7YORGh1nwb/b3qKN1H9K8QLJlnsc+0Jzr2IXniBIjL/ddJx+O3YGkpQ5Ce
         atW+ugVT5qZ2acohxwN2lGT63PqVNKPl0CwLIfJlt8uWF2SAWn8cnBMsI2zVe9iv1Wbd
         0oew==
X-Gm-Message-State: AOAM531vCgnWOPSQqTj8fPaQmQzpON6KpEUtVAVnuaB6bxv70dxEiOVB
	4r3jSwT3pn8H3B77WaeK6fAYlX4CfDAhzA==
X-Google-Smtp-Source: ABdhPJyLiBDotfHrhGzTOmGecvtOi21xcOHtpAybjkI6xzcfTjZ2UDI0x8MRc8PbCu1YM4sMiybqcQ==
X-Received: by 2002:a05:620a:5b7:: with SMTP id q23mr17001937qkq.59.1632315780497;
        Wed, 22 Sep 2021 06:03:00 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id a9sm1693583qko.27.2021.09.22.06.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Sep 2021 06:03:00 -0700 (PDT)
Message-ID: <d9b328d6-7e99-f0ba-2376-72829c28cff4@labbott.name>
Date: Wed, 22 Sep 2021 09:02:59 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-US
To: ksummit@lists.linux.dev,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "ksummit-discuss@lists.linuxfoundation.org"
 <ksummit-discuss@lists.linuxfoundation.org>
Cc: "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>
From: Laura Abbott <laura@labbott.name>
Subject: Reminder: Technical Advisory Board elections end September 23rd 16:00
 GMT-4 (US/Eastern)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Thank you everyone who has voted so far in the 2021 Technical Advisory
Board elections. Voting will run through September 23rd 16:00 GMT-4
(US/Eastern).

If you cannot find your ballot in your e-mail, please e-mail
tab-elections@lists.linuxfoundation.org.

If you thought you should have gotten a ballot but did not see one
please fill out the CIVS opt-in form
https://civs1.civs.us/cgi-bin/opt_in.pl
and e-mail tab-elections@lists.linuxfoundation.org

If you did not yet request a ballot but are eligible under the following
criteria please contact tab-elections@lists.linuxfoundation.org

There exist three kernel commits in a mainline or stable released
kernel that both
- Have a commit date in the year 2020 or 2021
- Contain an e-mail address in one of the following tags or merged
tags (e.g. Reviewed-and-tested-by)
-- Signed-off-by
-- Tested-by
-- Reported-by
-- Reviewed-by
-- Acked-by

If you have any other feedback, please e-mail
tab-elections@lists.linuxfoundation.org

Thanks,
Laura

