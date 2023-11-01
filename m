Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0787DE801
	for <lists@lfdr.de>; Wed,  1 Nov 2023 23:19:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD48028180C
	for <lists@lfdr.de>; Wed,  1 Nov 2023 22:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B7831BDF0;
	Wed,  1 Nov 2023 22:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WR3RO/Fo"
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54F101CD
	for <ksummit@lists.linux.dev>; Wed,  1 Nov 2023 22:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35948f3d2bfso374185ab.0
        for <ksummit@lists.linux.dev>; Wed, 01 Nov 2023 15:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698877160; x=1699481960; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y3G28rrGwY747NOuF3aMRkujZjnXHa+QDkrl8U7EU4w=;
        b=WR3RO/FozXPuCy2y9hC3vpcjkprB8M8vZeUnos7Whb2UHskhLFQBheC17CEySONL4V
         oEqHQzYQQUhhd7IO8SNwioqBJ3TJwE89gWRAsHRNs/VfCkacGhsEmGZ3HDHbUh4rB2P7
         cQdHGh0OP4nzjDi4sWhOPByta8F8bc3H/NkPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698877160; x=1699481960;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y3G28rrGwY747NOuF3aMRkujZjnXHa+QDkrl8U7EU4w=;
        b=AOrEvOQ02fyivRXGCFVY4/5LG26A67q56AP1RIUwl0K+iwT9d25pPzjNGxUHtK/BCt
         5j19a/sVnpAbT1SWWPM+Ikq8Thx5WjBMoQo85qCdvVg9fBZV9RUQqSeJ175cqW+S/Tp/
         UNZfrf7R2WrvH425fsQUvRvWrfhfOZIhJKILPAKF8QhrpflkY0PN8ArUqH3FYtSGg2Gr
         0LPk/B7jForSqX6N04Qx+91ife4jrBduSuNS3NoEUPEgmpoR5oTRiebJKIfuffTzSt1b
         BjBiw8bd6pGgIAhciIP3/5yInptSQhtOeHWl2ISmWiesXY3w4ISglkWEg8ZwugvAHiYS
         MSqQ==
X-Gm-Message-State: AOJu0YxdQfEm3D+NUvZ7vcv9ixgZFvrCdtWQoGx/2rxxinP+IW8Q4dkH
	pHZj70r3ef8UGm4QS2p8lBnQzFxuT7sOPWivhVs=
X-Google-Smtp-Source: AGHT+IEIQbuivKA5oTXGWX4jujslWfGo7hfrnVpnQtXfWeedESt6ZsRiGPzYOhnS4yAC2bM6ESf55Q==
X-Received: by 2002:a5d:8b13:0:b0:79a:c487:2711 with SMTP id k19-20020a5d8b13000000b0079ac4872711mr17117546ion.0.1698877159952;
        Wed, 01 Nov 2023 15:19:19 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d9bcf000000b007951e14b951sm1229060ion.25.2023.11.01.15.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Nov 2023 15:19:19 -0700 (PDT)
Message-ID: <aef1eb0e-b708-4092-a15e-df0b158f0ad4@linuxfoundation.org>
Date: Wed, 1 Nov 2023 16:19:18 -0600
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: ksummit@lists.linux.dev
Cc: Shuah Khan <skhan@linuxfoundation.org>, contact@linuxplumbersconf.org
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [ANN] Tips and Strategies for Reducing Stress and Burnout by Creating
 Psychological Safety
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Several people suggested topics for the upcoming Maintainer and Kernel
Summits to discuss and find solutions to address to maintainer stress,
and burnout.

It is important to pursue and find solutions to this problem to ensure
the kernel community continues to stay healthy and successful.

The Linux Plumbers Conference Program Committee is pleased to announce
that we have invited Dr. Gloria Chance to host a session at the Kernel
Summit on November 15th 2023 to share tips and strategies for reducing
stress and burnout. We hope this session will provide much needed help
for maintainers and developers seeking such resources.

We thank the Linux Foundation for providing funding to make this
happen.

Title:
Tips and Strategies for Reducing Stress and Burnout by Creating
Psychological Safety

In today's hybrid computing and work environments, many challenges
make it difficult to collaborate, communicate and feel a sense of
belonging as a team-member.  It can become increasingly difficult
to develop trust and teamwork in these environments which impact
innovation and productivity. Creating psychological safety can be
helpful when embracing strategies that reduce stress and burnout.
Learn strategies that build trust, support for team members;
leverage collaborative language; demonstrate understanding and empathy
and self-awareness.

Please reach out if you have any questions.

thanks,
-- Shuah Khan (on behalf of the Linux Plumbers Conference Program Committee)



