Return-Path: <ksummit+bounces-230-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sjc.edge.kernel.org (sjc.edge.kernel.org [IPv6:2604:1380:1000:8100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF7C3B48B9
	for <lists@lfdr.de>; Fri, 25 Jun 2021 20:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sjc.edge.kernel.org (Postfix) with ESMTPS id 8D4903E0FE1
	for <lists@lfdr.de>; Fri, 25 Jun 2021 18:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14486D11;
	Fri, 25 Jun 2021 18:25:05 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE7E2FB2
	for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 18:25:04 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h11so11552175wrx.5
        for <ksummit@lists.linux.dev>; Fri, 25 Jun 2021 11:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=tHiwB1xqrYkGxoQInv8l4W1sd/wZqSGejgjsXO5Jjko=;
        b=BBRadoT7VOr4KBigvldQXJ+fzqQULvtKXoqFj/3qh8rN7/W1+N7oqezadbMyAaKVRK
         lP3SAEt4xclySqDAj9e8+94p7L5jf11mDwpMugt9xoaOBscvf9vBXEgmK1TsghO96FZy
         HLguSjLTMFgUg3BIfKMJT+qPOLHXUq+pSu8Wnet8Q4GhIZuHVpHXVksbkxHKiJ36Iow+
         dP3Ea065CJZpVlo53b3d4y4ccUSNDSm2PV6FSPFhsBcmoleOS9/wfh4T0pNheCzrnJxT
         BoZcoFsiVQwui43ZdH629Eh/lo8621HxwoFbQx7UHlKIJwKp3jYNDgZWwmabF6Gh5MAV
         ws+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=tHiwB1xqrYkGxoQInv8l4W1sd/wZqSGejgjsXO5Jjko=;
        b=NEkg4f7urst/IXKSq8fejb0NZ7IdoJ5h07h47Cgp4t+MpIAmIlAfbYyY+zE0qznozl
         dX3TqFcxFa/HZYp7VLOqJrNKycGsj69rlmKjFWvCHJrHAG1kI7sEnVqgQpZEeqjYiulE
         ZtVemvLQtpLMPfuBsG/H0ZxHB4JlANfe/wvhuFGjead1HbU5Hk4fFo+ZDt/sBnnhOusf
         Mu2eL3o5ZK3GcLZe8vUlkRCJzamVSV056NxNSzNnL6XuzFbBAsy7KXFwTW1BocjdKuF6
         oa7cFP6941HVbK3Y4nebXulFo/1Mtx2dXN9a3WbDJT7krO4dZ4okMNJo7Wr3FUAYfIfW
         eNmA==
X-Gm-Message-State: AOAM530kLM/kSAbSI96TTL1LmhkV9hy1fEoot7A1/ROUgb1QAH1FS18I
	2e9loGwGdXAvrsIZMQ/pdlXeqETiJHM=
X-Google-Smtp-Source: ABdhPJzXJKxF4yKGA/sv6TaUu+RnBH2MQUWKbBbzxCjhugoVOXbHHS8dnAD2eX5okw0FoYC6QNwZ+w==
X-Received: by 2002:a5d:4d11:: with SMTP id z17mr12786091wrt.387.1624645503279;
        Fri, 25 Jun 2021 11:25:03 -0700 (PDT)
Received: from [192.168.8.197] ([148.252.129.92])
        by smtp.gmail.com with ESMTPSA id z5sm6934934wrt.11.2021.06.25.11.25.02
        for <ksummit@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 11:25:02 -0700 (PDT)
To: ksummit@lists.linux.dev
From: Pavel Begunkov <asml.silence@gmail.com>
Subject: [TECH TOPIC] io_uring: BPF controlled I/O
Message-ID: <b13d6f81-1679-dada-5bdf-1f94e0ba44c1@gmail.com>
Date: Fri, 25 Jun 2021 19:24:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

io_uring is an asynchronous I/O API crafted for efficiency, where one of
the reasons for using shared rings is to reduce context switching. It got
lots of of features since introduction, and pushing it further we want
to give away some of the control over submitting and controlling I/O to
BPF, minimising the number of context switches even more.

- It should keep the number of system calls to a minimum.
- Help to lower overhead on scheduling user processes to CPUs
  when they have not much to do and will go to sleep briefly.
- Be an alternative to submission queue polling for latency
  reduction not taking as much CPU time at the same moment.

We'll go over the current design [1] and decisions, issues and plans,
and hopefully it will engage a discussion and give impetus to curious
minds to try it out and share ideas on how to tailor the API to fit
their use cases.

[1] https://lore.kernel.org/io-uring/a83f147b-ea9d-e693-a2e9-c6ce16659749@gmail.com/T/#m31d0a2ac6e2213f912a200f5e8d88bd74f81406b

-- 
Pavel Begunkov

