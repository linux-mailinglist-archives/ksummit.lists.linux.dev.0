Return-Path: <ksummit+bounces-611-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from ewr.edge.kernel.org (ewr.edge.kernel.org [147.75.197.195])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EABA41162B
	for <lists@lfdr.de>; Mon, 20 Sep 2021 15:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ewr.edge.kernel.org (Postfix) with ESMTPS id A3CC91C0445
	for <lists@lfdr.de>; Mon, 20 Sep 2021 13:57:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A183FC9;
	Mon, 20 Sep 2021 13:57:10 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3357E3FC5
	for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 13:57:09 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id r18so11165025qvy.8
        for <ksummit@lists.linux.dev>; Mon, 20 Sep 2021 06:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oxidecomputer.com; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=ixZsglSnnYNu74IDkiQfs+ZYBeCsWtXcrporrs7/SeM=;
        b=LcXgEutnZZsUMddw6zMlMkkyFElxHwQdd4kdkA2r8fYQgiBTfRcSDivn+yJJcTKVpP
         dyL1uP1LS0jP71ax77Hdw4AmNyAJ14G3OgJ4CHWyjnP8xt5PeLJEuo+s+6lJLkikCC2b
         gXpzvFWSSWOHkUa1LmC1mywcWdHEFnfAnsZ6sebDfXH0cX/BzrzIQyvhVajOkjihrpOU
         c5f/tt46ThS1Qr2FIx3uEUJ3PQhR2bGV8CsBwNfAa3P53G3hD1gQDaPJ8b8PqeWxhXI0
         MrBIBhZelx4yo3/6Vx+0G0A696rWB36qQQRxA/Nj0ihUvmJaRYJpElamnEqg+nXCOzEg
         WAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=ixZsglSnnYNu74IDkiQfs+ZYBeCsWtXcrporrs7/SeM=;
        b=1AUq5Eg9qBVYrARKltGjz0GTnWkcqP3qxYCCD+40i1HttuhklsgqxmB+LwvAiuM/Ja
         r+vuLOvDD8o7gxzDeeIYUT7cYC1hDX02/gTFJDjqXRkG3k7GrOuaIa5ICwV/EqsT2Cxw
         MP+M4DnqnTvjhL49UzKCKITjyg2+P5kV3CwquZ55HSkOxfepgqv2b/LxOb9pXWSidAXr
         moMs1nXxySrnr5mhQGu/ftq49yhKCPbf+S5kk1ULwT69fhe4awTOhyXkzovrdKrSqQ5o
         aKlYiaQQOtCd/WGDkSJ4/t5bGJHNFKQEgut3u9t6RlzWzOlLFhfPeV7XowRRN7wunOIB
         9coA==
X-Gm-Message-State: AOAM530DJfWjIRmH62oAxCjT/trh7ss7h+VEorfJS3kPirj6HfNj+vMG
	bCH/TsBqrcAXT5ZNXh6b4GhTAsD91ICQX2cz
X-Google-Smtp-Source: ABdhPJyhKSVZyvN6bYMYr94Ja8VU5RrQx6X6PnbykN1riYPslBcV6O6Nin9/igPtsrTiFBChMwN6xA==
X-Received: by 2002:ad4:4765:: with SMTP id d5mr16092538qvx.51.1632146227568;
        Mon, 20 Sep 2021 06:57:07 -0700 (PDT)
Received: from [192.168.1.168] (pool-74-109-246-95.pitbpa.fios.verizon.net. [74.109.246.95])
        by smtp.gmail.com with ESMTPSA id bi10sm7048934qkb.36.2021.09.20.06.57.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 06:57:06 -0700 (PDT)
Message-ID: <44ee2bfe-e4bc-b918-b908-7352ea012524@oxidecomputer.com>
Date: Mon, 20 Sep 2021 09:57:05 -0400
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
 "tech-board-discuss@lists.linuxfoundation.org"
 <tech-board-discuss@lists.linuxfoundation.org>
Cc: "tab-elections@lists.linuxfoundation.org"
 <tab-elections@lists.linuxfoundation.org>
From: Laura Abbott <laura@oxidecomputer.com>
Subject: IMPORTANT: CIVS opt-in for Technical Advisory Board voting
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

As in the past we are using CIVS (https://civs1.civs.us/) for voting.
This year you need to explicitly opt-in to vote in a private poll. This
is a change on the CIVS end and was probably added due to concerns about
spam/abuse of the service.

Please opt-in at https://civs1.civs.us/cgi-bin/opt_in.pl

If you have any questions please feel free to e-mail
tab-elections@lists.linuxfoundation.org

Thanks,
Laura

