Return-Path: <ksummit+bounces-622-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F27D411AFB
	for <lists@lfdr.de>; Mon, 20 Sep 2021 18:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id 06FE21C0A75
	for <lists@lfdr.de>; Mon, 20 Sep 2021 16:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF7F3FCC;
	Mon, 20 Sep 2021 16:53:52 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE492FB3
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 16:53:50 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id t4so44945130qkb.9
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=labbott.name; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OUGz0PuSbbybtRH66I6txS95faxT4LuGSV+sAKO/f0s=;
        b=XwjMKTnXngJTB05gr1CM8OAw9ZLJ5QffJdbB+Mn1T7DxrPyypZrPcokIddSPHECwO8
         t8GRuiKoI7+SzCmb5cehGj1rWGArEQswsqIQq9e9llaTKG2+uQQprHoYM6jmpv/urMI/
         W+QijuYDfLmvm7ZS95uaWZsfBAbnfPkqg9z/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OUGz0PuSbbybtRH66I6txS95faxT4LuGSV+sAKO/f0s=;
        b=JxEWwexc7r7Nv8wWXyklZvfudllgZjdfKv6OF5H4uM4BU3txUcvog352Kt25cF0IYf
         4U6CnIJBFHM97qsPfqJfppEfyA4860+VoP5s/5StEqhHw0RPxpm4MylyuIjs1/dcIfwJ
         QXAqYP5BBRoWKpf8p4dh6Q0Y+e32CpK0VQMR4xXaVDtuonvYk6VJlWnBrtzbxkQ+c+dP
         zT/mVCtEJxV1Q5O8nOEy3K7MZ0f8+mjRRO3DEgLR7ePr7n3bl6lIUkpJJVfDrGhWpYAJ
         PPy1tGopKVllpi64cRm+HCRaJrkWprTqMyqa2oHGwDv1bKqUU/D6iR7VPhON31Ptznat
         dT+A==
X-Gm-Message-State: AOAM532gB/HbBNmO/MQnEKYsBVbpaQZwoksOZT18SJnUMRxszsurn6xe
	qIX1Dtb+j7SVpwgEQ3wk8/lQjQ==
X-Google-Smtp-Source: ABdhPJygir2fpG5Mbn7SzUrlfqznZYFgAcVs6M6VcULtZy0UipFbNc+8a0WZLtzOtEbXWFPOuZC/zQ==
X-Received: by 2002:a37:c83:: with SMTP id 125mr8261726qkm.229.1632156829380;
        Mon, 20 Sep 2021 09:53:49 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id d23sm3201938qto.91.2021.09.20.09.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:53:48 -0700 (PDT)
Message-ID: <ebcaac1d-9b97-81d9-28eb-eeb51c51673f@labbott.name>
Date: Mon, 20 Sep 2021 12:53:48 -0400
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [Tech-board-discuss] IMPORTANT: CIVS opt-in for Technical
 Advisory Board voting
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Dave Hansen <dave@sr71.net>,
 "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>, ksummit@lists.linux.dev,
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
 <dfa20866-0d00-9bd3-6078-5544cfa5b633@sr71.net>
 <CAMuHMdUUfm6u_Pz3qzA0V7tLZd7jhcwdyxU7L0SyC_EdyzwQxw@mail.gmail.com>
 <CAMuHMdVtHDQ2f0VKAdQFQV9dZJ5uFGD9yHvNviQ_k7AEfhN77w@mail.gmail.com>
 <bf22702e-01b2-214a-1650-da9e4ec3c2be@labbott.name>
 <20210920162329.GJ4192@sirena.org.uk>
 <5c88ae67-df7b-60ab-d087-bd244753c98f@labbott.name>
 <20210920164837.GK4192@sirena.org.uk>
From: Laura Abbott <laura@labbott.name>
In-Reply-To: <20210920164837.GK4192@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/20/21 12:48, Mark Brown wrote:
> On Mon, Sep 20, 2021 at 12:30:23PM -0400, Laura Abbott wrote:
>> On 9/20/21 12:23, Mark Brown wrote:
> 
>>> Will we be getting some futher mail when we should vote?  I opted in but
>>> didn't vote at that time - I saw the vote was listed but didn't realise
>>> that voting was open since people still seemed to be nominating.
> 
>> Nominations are now closed and voting is now open. Please vote at your
>> convenience.
> 
> How can I do this?  As (IIRC) Geert reported if you've activated your
> mail then attempting to activate again causes CIVS to report "This email
> address is already activated" with no link to any existing polls.
> 

CIVS said it should give a list of all polls but perhaps that didn't
happen. I'll see if I can get it to resend.

Thanks,
Laura

