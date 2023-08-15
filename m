Return-Path: <ksummit+bounces-983-lists=lfdr.de@lists.linux.dev>
X-Original-To: lists@lfdr.de
Delivered-To: lists@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD177D1EB
	for <lists@lfdr.de>; Tue, 15 Aug 2023 20:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AD66280402
	for <lists@lfdr.de>; Tue, 15 Aug 2023 18:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C9F1802C;
	Tue, 15 Aug 2023 18:34:40 +0000 (UTC)
X-Original-To: ksummit@lists.linux.dev
Received: from blackbird.sr71.net (unknown [198.145.64.142])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37F4014276
	for <ksummit@lists.linux.dev>; Tue, 15 Aug 2023 18:34:38 +0000 (UTC)
Received: from [134.134.137.85] (unknown [134.134.137.85])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id 1596720203;
	Tue, 15 Aug 2023 11:34:38 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------9WuX4fs0k861mck0qajBS7SM"
Message-ID: <e4d1bf8f-cbb5-935d-1a55-7650dff591ab@sr71.net>
Date: Tue, 15 Aug 2023 11:34:37 -0700
Precedence: bulk
X-Mailing-List: ksummit@lists.linux.dev
List-Id: <ksummit.lists.linux.dev>
List-Subscribe: <mailto:ksummit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:ksummit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [MAINTAINERS SUMMIT] Quality standards for embargoed code
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>
Cc: ksummit@lists.linux.dev
References: <ZNuuvS5BtmjcazIv@sashalap>
 <53f0072b-91c0-0136-a689-f31e8508a862@sr71.net> <ZNvBomFMyZTYm7ye@sashalap>
From: Dave Hansen <dave@sr71.net>
In-Reply-To: <ZNvBomFMyZTYm7ye@sashalap>

This is a multi-part message in MIME format.
--------------9WuX4fs0k861mck0qajBS7SM
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/15/23 11:19, Sasha Levin wrote:
> On Tue, Aug 15, 2023 at 10:19:21AM -0700, Dave Hansen wrote:
>> On 8/15/23 09:58, Sasha Levin wrote:
...>>> 1. Ask (require) organizations that repeatedly go through this
mechanism
>>> to create a test environment that can demonstrate how the embargoed code
>>> passes different build/validation tests. We should set a minimal bar to
>>> the demonstrated quality of code that we'll "sneak" behind the backs of
>>> community members.
>>
>> Intel does send things through 0day internally, with a few minor
>> differences from how public stuff gets tested.  But, I don't think any
>> information about that internal testing ever makes it into the material
>> that get merged.  We'll fix that.
> 
> Beyond running tests, it would also be great to standardize on what we
> need to run, and if Intel wants to start the discussion by openning up
> it's tests for embargoed code then it'll e a great start!

I'll go rattle some cages.  It might be boring old 0day, but I'll find out.

>>> 2. Create a group of trusted "testers" who can test embargoed code with
>>> different (ideally "real") workloads and environments. I think that
>>> we're overly focused on keeping the circle of people in the know small.
>>
>> The docs:
>>
>>> https://www.kernel.org/doc/html/latest/process/embargoed-hardware-issues.html
>>
>> _should_ allow the "hardware security team" to add testers today:
> 
> It probably does, but the way it's written now you'd need a lawyer to
> confirm that.

How about something like the attached patch for that doc?  Does that
help ensure we leave the lawyers alone? :)
--------------9WuX4fs0k861mck0qajBS7SM
Content-Type: text/x-patch; charset=UTF-8;
 name="embargoed-hardware-issues.patch"
Content-Disposition: attachment; filename="embargoed-hardware-issues.patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9lbWJhcmdvZWQtaGFyZHdhcmUt
aXNzdWVzLnJzdCBiL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9lbWJhcmdvZWQtaGFyZHdhcmUt
aXNzdWVzLnJzdAppbmRleCBjYjY4NjIzOGYyMWQuLjQzZjk2ZWQ3MDliYSAxMDA2NDQKLS0t
IGEvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL2VtYmFyZ29lZC1oYXJkd2FyZS1pc3N1ZXMucnN0
CisrKyBiL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9lbWJhcmdvZWQtaGFyZHdhcmUtaXNzdWVz
LnJzdApAQCAtOTUsMTMgKzk1LDE1IEBAIFRoZSBMaW51eCBrZXJuZWwgY29tbXVuaXR5IGhh
cyBhIGRlZGljYXRlZCBoYXJkd2FyZSBzZWN1cml0eSB0ZWFtIGZvcgogaW5pdGlhbCBjb250
YWN0LCB3aGljaCBvdmVyc2VlcyB0aGUgcHJvY2VzcyBvZiBoYW5kbGluZyBzdWNoIGlzc3Vl
cyB1bmRlcgogZW1iYXJnbyBydWxlcy4KIAotVGhlIGhhcmR3YXJlIHNlY3VyaXR5IHRlYW0g
aWRlbnRpZmllcyB0aGUgZGV2ZWxvcGVycyAoZG9tYWluIGV4cGVydHMpIHdobwotd2lsbCBm
b3JtIHRoZSBpbml0aWFsIHJlc3BvbnNlIHRlYW0gZm9yIGEgcGFydGljdWxhciBpc3N1ZS4g
VGhlIGluaXRpYWwKLXJlc3BvbnNlIHRlYW0gY2FuIGJyaW5nIGluIGZ1cnRoZXIgZGV2ZWxv
cGVycyAoZG9tYWluIGV4cGVydHMpIHRvIGFkZHJlc3MKLXRoZSBpc3N1ZSBpbiB0aGUgYmVz
dCB0ZWNobmljYWwgd2F5LgotCi1BbGwgaW52b2x2ZWQgZGV2ZWxvcGVycyBwbGVkZ2UgdG8g
YWRoZXJlIHRvIHRoZSBlbWJhcmdvIHJ1bGVzIGFuZCB0byBrZWVwCi10aGUgcmVjZWl2ZWQg
aW5mb3JtYXRpb24gY29uZmlkZW50aWFsLiBWaW9sYXRpb24gb2YgdGhlIHBsZWRnZSB3aWxs
IGxlYWQgdG8KK1RoZSBoYXJkd2FyZSBzZWN1cml0eSB0ZWFtIGlkZW50aWZpZXMgdGhlIGRv
bWFpbiBleHBlcnRzIHdobyB3aWxsIGZvcm0gdGhlCitpbml0aWFsIHJlc3BvbnNlIHRlYW0g
Zm9yIGEgcGFydGljdWxhciBpc3N1ZS4gVGhlIGluaXRpYWwgcmVzcG9uc2UgdGVhbSBjYW4K
K2JyaW5nIGluIGZ1cnRoZXIgbWVtYmVycyB0byBhZGRyZXNzIHRoZSBpc3N1ZSBpbiB0aGUg
YmVzdCB0ZWNobmljYWwgd2F5LgorVGhlc2UgbWVtYmVycyBjYW4gYmUgZXhwZXJ0cyBpbiBh
IHBhcnRpY3VsYXIgYXJlYSBvZiB0aGUga2VybmVsIGxpa2UgYQorc3Vic3lzdGVtIChQQ0ks
IHNjaGVkdWxlciwgbWVtb3J5IG1hbmFnZW1lbnQsIGV0Yy4uLikgb3IgYW4gYXNwZWN0IG9m
CitrZXJuZWwgZGV2ZWxvcG1lbnQgbGlrZSB0ZXN0aW5nLgorCitBbGwgdGhvc2UgaW52b2x2
ZWQgcGxlZGdlIHRvIGFkaGVyZSB0byB0aGUgZW1iYXJnbyBydWxlcyBhbmQgdG8ga2VlcCB0
aGUKK3JlY2VpdmVkIGluZm9ybWF0aW9uIGNvbmZpZGVudGlhbC4gVmlvbGF0aW9uIG9mIHRo
ZSBwbGVkZ2Ugd2lsbCBsZWFkIHRvCiBpbW1lZGlhdGUgZXhjbHVzaW9uIGZyb20gdGhlIGN1
cnJlbnQgaXNzdWUgYW5kIHJlbW92YWwgZnJvbSBhbGwgcmVsYXRlZAogbWFpbGluZy1saXN0
cy4gSW4gYWRkaXRpb24sIHRoZSBoYXJkd2FyZSBzZWN1cml0eSB0ZWFtIHdpbGwgYWxzbyBl
eGNsdWRlCiB0aGUgb2ZmZW5kZXIgZnJvbSBmdXR1cmUgaXNzdWVzLiBUaGUgaW1wYWN0IG9m
IHRoaXMgY29uc2VxdWVuY2UgaXMgYSBoaWdobHkK

--------------9WuX4fs0k861mck0qajBS7SM--

