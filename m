Return-Path: <ksummit+bounces-1195-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C07CEE91
	for <lists@lfdr.de>; Thu, 19 Oct 2023 06:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB264B20F1B
	for <lists@lfdr.de>; Thu, 19 Oct 2023 04:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617F11FD2;
	Thu, 19 Oct 2023 04:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JChDdINQ"
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F7F17C2
	for <ksummit@lists.linux.dev>; Thu, 19 Oct 2023 04:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2c515527310so67470571fa.2
        for <ksummit@lists.linux.dev>; Wed, 18 Oct 2023 21:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697688699; x=1698293499; darn=lists.linux.dev;
        h=cn:content-disposition:mime-version:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=myuCYeJM46kBGvhwTJjYjvzOGKOZ+6IkjM9iYH2ZIlQ=;
        b=JChDdINQefK4Y/bVmqSuJihaYjlH8oxUkKCWzMr6huF34GloBYMh9+x4fsNfrdhNU6
         nwmYbSwja0zECYmirl5W0gaSWIGxHTTw0Ff1CvHcOw606FTNJ4jX9zK+BEMSJlmnZhdw
         aKcE5oDYtwPNISInR5EEyutdaP/v3M3zF0/l5L3wNnfyhHV8Y+MJcEZJ6Ea208rbLuVu
         iLsLll7cuI0uTKWXofszcaRpABnUcvPSW/R9pqjTQZSzy4fQmrJ2AFZjgaecW0ziZ5Xg
         y4BbfD86dR0e7QAk2mXNbUxk9oEYL7IA12eOUgQoIjoBD6O3U53eoqjowReRhtUhcfH5
         0nJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697688699; x=1698293499;
        h=cn:content-disposition:mime-version:message-id:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=myuCYeJM46kBGvhwTJjYjvzOGKOZ+6IkjM9iYH2ZIlQ=;
        b=fkfordDhEhjJ7qCHpxsjvFJkb3BN1mt3jmFfp7btjotw4sbwgqDDUq/InjT5BYBvhW
         zKbRK5uyniwv+Eq6CAA8Zl8dRRp6OoAQUhQpf11/0XskZ4p3BeY41xDWEQoPiBIa4ooM
         QsU442SNTCG3p/oB2TRozrsmCxQ8wllUyfzhlv9bsJNYiMAFq5EDgMGcdJNYstYqvXKj
         FFids/FiAUBGj6qhAAYpWzHUwo+DVg7UspjWqWWDTU3iss3i7V/RMyBbKVl5T/CLPahQ
         W9zD5kdQPaeP2gccnfUbniIhlrdNA9QeNhqZzs8I6hoqpia2FsTdbIrNVp4dmir0yilg
         Lmfw==
X-Gm-Message-State: AOJu0Yzdiz4P7q9dH2vt1VE9LBDjOow1ZW09fwjO0YgCgqD54F6UlOlm
	fIdOFdNP3ybkWiTVAIkGoopvoy8JZkmFaYNzXqY=
X-Google-Smtp-Source: AGHT+IGPD/XShFyYcXcP6LTLE7f542kIUhnUaL0S94qudfW/4Kjq9wloGBXpkYF5vY5HTV0XjXLkRg==
X-Received: by 2002:a2e:8ecc:0:b0:2c5:115c:2d33 with SMTP id e12-20020a2e8ecc000000b002c5115c2d33mr517582ljl.3.1697688699320;
        Wed, 18 Oct 2023 21:11:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c499100b0040772138bb7sm3234160wmp.2.2023.10.18.21.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 21:11:38 -0700 (PDT)
Date: Thu, 19 Oct 2023 07:11:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ksummit@lists.linux.dev
Cc: outreachy@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: KTODO automated TODO lists
Message-ID: <369bc919-1a1d-4f37-9cc9-742a86a41282@kadam.mountain>
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cn: outreachy@lists.linux.dev,kernel-janitors@vger.kernel.org

Yesterday someone on my lists just sent an email looking for kernel
tasks.  This was a university student in a kernel programming class.
We also have kernel-janitors and outreachy and those people are always
asking for small tasks.

One thing that I sometimes say as a reviewer is "This isn't caused by to
your patch but I noticed something wrong."  We could add that kind of
thing to a todo list by using a KTODO line.

KTODO: add check for failure in function_something()

Then people can look on lore or use lei to find small tasks to work on
or they could use lei.

lei q -I https://lore.kernel.org/all/ -o ~/Mail/KTODO --dedupe=mid 'KTODO AND rt:6.month.ago..'

Then grep ^KTODO ~/Mail/KTODO -R and cat the filename you want.

regards,
dan carpenter

